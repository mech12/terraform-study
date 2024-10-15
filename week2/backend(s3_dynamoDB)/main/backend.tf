terraform {
  backend "s3" {
    bucket         = "akbun-t101study-tfstate3"
    key            = "terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "terraform-locks"
    # encrypt        = true
  }
}
