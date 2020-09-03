provider "kubernetes" {
    config_context_cluster   = "minikube"
}
resource "kubernetes_deployment" "abhiwp" {
  metadata {
    name = "wordpress"
  }
  spec {
    replicas = 3    
    selector{
    match_labels = {
      env = "Development"
      dc = "IN"
      App = "wordpress"
    }
    match_expressions {
      key = "env"
      operator = "In"
      values = ["Development" , "wordpress"]
    }
  }
   template {
        metadata {
         labels = {
      env = "Development"
      dc = "IN"
      App = "wordpress"
    }
        }


      spec {
        container {
          image = "wordpress"
         // image = "wordpress:4.8-apache"
          name  = "abhiwordpress"
        }
      }
    }
}
}
resource "kubernetes_service" "abhiwplb" {
  metadata {
    name = "loadbalancer"
  }
  spec {
    selector = {
      App = kubernetes_deployment.abhiwp.spec.0.template.0.metadata[0].labels.App
    }
    port {
      node_port   = 30100 
      port        = 80
      target_port = 80
    }
    type = "NodePort"
} 
}
