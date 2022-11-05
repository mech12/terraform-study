variable "subnet1" {
  description = "subnet 1"
  type        = string
  sensitive   = true
}

variable "subnet2" {
  description = "subnet 2"
  type        = string
  sensitive   = true
}

variable "security_group" {
  description = "security_group"
  type        = string
  sensitive   = true
}

variable "db_username" {
  description = "The username for the database"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "The password for the database"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "The name to use for the database"
  type        = string
  default     = "tstudydb"
}
