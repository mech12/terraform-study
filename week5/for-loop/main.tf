provider "aws" {
  region  = "ap-northeast-2"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

locals {
  map = {
    a = 1
    b = 2
    c = 3
  }
}