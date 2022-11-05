data "terraform_remote_state" "dev_remote" {
  backend = "s3"
  config = {
    bucket = "akbun-t101study-tfstate"
    key    = "dev/terraform.tfstate"
    region = "ap-northeast-2"
  }
}
