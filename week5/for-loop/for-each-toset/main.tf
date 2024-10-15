provider "aws" {
  region = "us-west-2"
}

variable "user_names" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = ["aaa", "bbb", "ccc"]
}

# resource "aws_iam_user" "for_each_set" {
#   for_each = toset(var.user_names)
#   name = each.key
# }

resource "aws_iam_user" "count" {
  count = length(var.user_names)
  name  = var.user_names[count.index]
}
