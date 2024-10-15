resource "aws_vpc" "myvpc" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_subnet" "mysubnet3" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.10.3.0/24"

  availability_zone = "us-west-2a"

  tags = {
    Name = "t101-subnet3"
  }
}

resource "aws_subnet" "mysubnet4" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.10.4.0/24"

  availability_zone = "us-west-2c"

  tags = {
    Name = "t101-subnet4"
  }
}
