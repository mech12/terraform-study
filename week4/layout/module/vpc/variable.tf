variable "vpc_name" {
  type        = string
  default     = "akbun-vpc"
  sensitive   = true
  description = "vpc name"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.10.0.0/16"
  description = "vpc cidr"
}

variable "subnet_name" {
  type        = string
  default     = "akbun-subnet"
  sensitive   = true
  description = "subnet name"
}

variable "subnet_cidr" {
  type        = string
  default     = "10.10.1.0/24"
  description = "subnet cidr"
}
