data "terraform_remote_state" "remote_vpc" {
  backend = "s3"
  config = {
    bucket = "akbun-t101study-tfstate"
    key    = "dev/vpc/terraform.tfstate"
    region = "ap-northeast-2"
  }
}
