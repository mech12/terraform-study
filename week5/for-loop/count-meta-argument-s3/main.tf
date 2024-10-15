provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "mys3bucket" {
  count  = 2
  bucket = "akbun-t101study-tfstate3"
}
