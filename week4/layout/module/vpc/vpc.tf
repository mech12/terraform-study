resource "aws_vpc" "akbun-vpc" {
  cidr_block       = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.vpc_name}"
  }
}

resource "aws_subnet" "akbun-subnet" {
  vpc_id     = aws_vpc.akbun-vpc.id
  cidr_block = var.subnet_cidr

  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "${var.subnet_name}"
  }
}

resource "aws_internet_gateway" "akbun-igw" {
  vpc_id = aws_vpc.akbun-vpc.id

  tags = {
    Name = "akbun-igw"
  }
}
