terraform {
  backend "s3" {
    bucket = "akbun-t101study-tfstate3"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}
