provider "aws" {
  region = "us-west-2"
}

resource "aws_db_instance" "myrds" {
  identifier_prefix = "t101-sensitivedata"
  engine            = "mysql"
  allocated_storage = 10
  # 호환되는 인스턴스 클래스 선택
  instance_class      = "db.t3.micro"
  skip_final_snapshot = true

  db_name  = "sensitive_example"
  username = var.db_username
  password = var.db_password
  # 필요한 경우 엔진 버전 명시
  # engine_version = "8.0.35"
}
