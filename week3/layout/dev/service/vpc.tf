resource "aws_subnet" "mysubnet1" {
  vpc_id     = var.vpc_id
  cidr_block = "10.10.1.0/24"

  availability_zone = "us-west-2a"

  tags = {
    Name = "t101-subnet1"
  }
}

resource "aws_subnet" "mysubnet2" {
  vpc_id     = var.vpc_id
  cidr_block = "10.10.2.0/24"

  availability_zone = "us-west-2c"

  tags = {
    Name = "t101-subnet2"
  }
}

resource "aws_internet_gateway" "myigw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "t101-igw"
  }
}

resource "aws_route_table" "myrt" {
  vpc_id = var.vpc_id

  tags = {
    Name = "t101-rt"
  }
}

resource "aws_route_table_association" "myrtassociation1" {
  subnet_id      = aws_subnet.mysubnet1.id
  route_table_id = aws_route_table.myrt.id
}

resource "aws_route_table_association" "myrtassociation2" {
  subnet_id      = aws_subnet.mysubnet2.id
  route_table_id = aws_route_table.myrt.id
}

resource "aws_route" "mydefaultroute" {
  route_table_id         = aws_route_table.myrt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.myigw.id
}
