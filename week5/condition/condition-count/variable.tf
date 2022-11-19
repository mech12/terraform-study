# reference: https://github.com/terraform-aws-modules/terraform-aws-vpc/blob/master/variables.tf#L1194
variable "create_igw" {
  description = "Controls if an Internet Gateway is created for public subnets and the related routes that connect them."
  type        = bool
  default     = true
}