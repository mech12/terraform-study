provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "mys3bucket" {
  bucket = "akbun-t101study-tfstate3"
}

output "s3_bucket_arn" {
  value       = aws_s3_bucket.mys3bucket.arn
  description = "The ARN of the S3 bucket"
}
