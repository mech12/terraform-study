provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "akbun-vpc" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "t101-study"
  }
}

resource "aws_subnet" "akbun-subnet1" {
  vpc_id     = aws_vpc.akbun-vpc.id
  cidr_block = "10.10.1.0/24"

  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "t101-subnet1"
  }
}

resource "aws_internet_gateway" "akbun-igw" {
  vpc_id = aws_vpc.akbun-vpc.id

  tags = {
    Name = "t101-igw"
  }
}

output "vpcid" {
  value       = aws_vpc.akbun-vpc.id
  description = "My VPC Id"
}

output "subnetid" {
  value       = aws_subnet.akbun-subnet1.id
  description = "akbun-subnet1"
}
