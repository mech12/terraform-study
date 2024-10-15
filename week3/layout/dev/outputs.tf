output "my_vpc_id" {
  value       = module.my-vpc.my_vpc_id
  description = "vpc"
}

output "db_address" {
  value       = module.my-db.db_address
  description = "Connect to the database at this endpoint"
}

output "db_port" {
  value       = module.my-db.db_port
  description = "The port the database is listening on"
}

# output "myalb_dns" {
#   value       = module.my-service.myalb_dns
#   description = "The DNS Address of the ALB"
# }
