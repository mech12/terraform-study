variable "vpc_id" {
  description = "vpc_id"
  type        = string
  sensitive   = true
}

variable "db_address" {
  description = "The username for the database"
  type        = string
  sensitive   = true
}

variable "db_port" {
  description = "The password for the database"
  type        = string
  sensitive   = true
}
