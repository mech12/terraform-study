module "my-vpc" {
  source = "../module/vpc"

  vpc_name = "akbun-vpc-dev"
  vpc_cidr = "10.10.0.0/16"
  subnet_name = "akbun-dev-public-subnet"
  subnet_cidr = "10.10.1.0/24"
}
