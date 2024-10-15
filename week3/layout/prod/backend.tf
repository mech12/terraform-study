terraform {
  backend "s3" {
    bucket         = "akbun-t101study-tfstate3"
    key            = "dev/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-locks-week3-files"
  }
}
