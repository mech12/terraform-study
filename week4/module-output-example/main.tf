module "my-vpc" {
  source = "./vpc"
}

resource "aws_instance" "example" {
  subnet_id  = module.my-vpc.my_subnet1_id
  ami           = "ami-0c76973fbe0ee100c"
  instance_type = "t2.nano"
  associate_public_ip_address = true

  tags = {
    Name = "t101-week4"
  }
}

output "myec2_public_ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP of the Instance"
}