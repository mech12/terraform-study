provider "aws" {
  region = "us-west-2"
}

data "terraform_remote_state" "remote" {
  backend = "s3"
  config = {
    bucket = "akbun-t101study-tfstate3"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}

resource "aws_instance" "example" {
  ami           = "ami-0c76973fbe0ee100c"
  instance_type = "t2.nano"
  subnet_id     = data.terraform_remote_state.remote.outputs.subnetid

  tags = {
    Name = "t101-week3"
  }
}
