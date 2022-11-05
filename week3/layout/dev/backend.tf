terraform {
  backend "s3" {
    bucket = "$NICKNAME-t101study-tfstate-week3-files"
    key    = "dev/terraform.tfstate"
    region = "ap-northeast-2"
    dynamodb_table = "terraform-locks-week3-files"
  }
}
