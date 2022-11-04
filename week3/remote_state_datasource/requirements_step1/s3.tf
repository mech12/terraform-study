provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_s3_bucket" "mys3bucket" {
  bucket = "akbun-t101study-tfstate"
}

output "s3_bucket_arn" {
  value       = aws_s3_bucket.mys3bucket.arn
  description = "The ARN of the S3 bucket"
}
