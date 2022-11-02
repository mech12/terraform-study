provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_db_instance" "myrds" {
  identifier_prefix      = "t101-sensitivedata"
  engine                 = "mysql"
  allocated_storage      = 10
  instance_class         = "db.t2.micro"
  skip_final_snapshot    = true

  db_name                = "sensitive_example"
  username               = var.db_username
  password               = var.db_password
}