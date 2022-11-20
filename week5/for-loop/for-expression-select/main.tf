variable "fruits_set" {
  type        = set(string)
  default     = ["apple", "banana"]
  description = "fruit example"
}

variable "fruits_list" {
  type        = list(string)
  default     = ["apple", "banana"]
  description = "fruit example"
}

variable "fruits_map" {
  type        = map(string)
  default     = {"first": "apple", "second": "banana"}
  description = "fruit example"
}