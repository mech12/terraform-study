output "my_vpc_id" {
  value       = aws_vpc.akbun-vpc.id
  description = "vpc"
}
output "my_subnet1_id" {
  value       = aws_subnet.akbun-subnet1.id
  description = "subnet1"
}
