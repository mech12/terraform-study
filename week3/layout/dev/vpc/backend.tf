terraform {
  backend "s3" {
    bucket = "akbun-t101study-tfstate"
    key    = "dev/vpc/terraform.tfstate"
    region = "ap-northeast-2"
    dynamodb_table = "terraform-locks-week3-files"
  }
}
