provider "aws" {
  region  = "ap-northeast-2"
}

data "aws_ami" "last_ami" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "server" {
  count = 2

  ami           = data.aws_ami.last_ami.id
  instance_type = "t2.nano"
}
