output "mysubnet3" {
  value       = aws_subnet.mysubnet3.id
  description = "mysubnet3"
}

output "mysubnet4" {
  value       = aws_subnet.mysubnet4.id
  description = "mysubnet4"
}

output "mysg" {
  value       = aws_security_group.mysg2.id
  description = "mysg"
}
