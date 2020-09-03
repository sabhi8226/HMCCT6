provider "aws" {
  region = "ap-south-1"
  profile = "AbhiTerras"
}
resource "aws_db_instance" "abhidatabase" {
  allocated_storage    = 20
  identifier           = "dbinstance"
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7.30"
  instance_class       = "db.t2.micro"
  name                 = "Abhidb"
  username             = "Abhi"
  password             = "redhatabc"
  parameter_group_name = "default.mysql5.7"
  publicly_accessible = true
  skip_final_snapshot  = true
  iam_database_authentication_enabled = true
  
  tags = {
    Name = "AbhiSQLDB"
  }
}

output "ip" {
    value = "${aws_db_instance.abhidatabase.address}"
}
