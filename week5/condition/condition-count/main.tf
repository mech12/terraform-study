provider "aws" {
  region  = "ap-northeast-2"
}

resource "aws_vpc" "akbun-vpc" {
  cidr_block       = "10.10.0.0/16"
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
  count = var.create_igw ? 1 : 0

  vpc_id = aws_vpc.akbun-vpc.id

  tags = {
    Name = "t101-igw"
  }
}

resource "aws_route_table" "myrt" {
  vpc_id = aws_vpc.akbun-vpc.id

  tags = {
    Name = "t101-rt"
  }
}

resource "aws_route_table_association" "myrtassociation1" {
  subnet_id      = aws_subnet.akbun-subnet1.id
  route_table_id = aws_route_table.myrt.id
}

resource "aws_route" "mydefaultroute" {
  route_table_id         = aws_route_table.myrt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.akbun-igw[0].id
}

output "my_vpc_id" {
  value       = aws_vpc.akbun-vpc.id
  description = "vpc"
}
