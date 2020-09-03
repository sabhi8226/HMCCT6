 resource "null_resource" "minikubeservice" {
  provisioner "local-exec" {
    command = "minikube service list"
    
  }
  depends_on = [
      kubernetes_deployment.abhiwp,
      kubernetes_service.abhiwplb,
      aws_db_instance.abhidatabase
 
     ]
}
