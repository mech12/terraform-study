variable "sample_a" {
  type    = list(string)
  default = ["aaa", "bbb", "ccc"]
}

variable "sample_b" {
  type    = map(string)
  default = { "aaa" : "aaa", "bbb" : "bbb", "ccc" : "ccc" }
}