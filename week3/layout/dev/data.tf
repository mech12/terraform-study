data "terraform_remote_state" "dev_remote" {
  backend = "s3"
  config = {
    bucket = "akbun-t101study-tfstate3"
    key    = "dev/terraform.tfstate"
    region = "us-west-2"
  }
}
