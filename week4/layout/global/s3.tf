locals {
  bucket_name = "akbun-t101-week4-local-example"
}

resource "aws_s3_bucket" "mys3bucket" {
  bucket = local.bucket_name
}
