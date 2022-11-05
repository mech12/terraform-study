
resource "aws_route_table" "myrt2" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "t101-rt2"
  }
}

resource "aws_route_table_association" "myrtassociation3" {
  subnet_id      = aws_subnet.mysubnet3.id
  route_table_id = aws_route_table.myrt2.id
}

resource "aws_route_table_association" "myrtassociation4" {
  subnet_id      = aws_subnet.mysubnet4.id
  route_table_id = aws_route_table.myrt2.id
}
