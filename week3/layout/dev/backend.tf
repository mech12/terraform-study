terraform {
  backend "s3" {
    bucket         = "akbun-t101study-tfstate3"
    key            = "dev/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-locks-week3-files"
  }
  required_providers {
    # aws = {
    #   source  = "hashicorp/aws"
    #   version = "4.15.1"
    # }
    # template = {
    #   source  = "hashicorp/template"
    #   version = "~> 2.2.0"
    # }
  }
}
