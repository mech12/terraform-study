data "terraform_remote_state" "remote_vpc" {
  backend = "s3"
  config = {
    bucket = "akbun-t101study-tfstate3"
    key    = "dev/vpc/terraform.tfstate"
    region = "us-west-2"
  }
}
