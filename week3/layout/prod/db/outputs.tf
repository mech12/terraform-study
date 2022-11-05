output "db_address" {
  value       = aws_db_instance.myrds.address
  description = "Connect to the database at this endpoint"
}

output "db_port" {
  value       = aws_db_instance.myrds.port
  description = "The port the database is listening on"
}
