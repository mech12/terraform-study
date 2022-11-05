module "my-vpc" {
  source = "./vpc"

  vpc_name = "t101-study-week-layout"
}

module "my-db" {
  source  = "./db"
  depends_on = [module.my-vpc]

  subnet1 = module.my-vpc.mysubnet3
  subnet2 = module.my-vpc.mysubnet4
  security_group = module.my-vpc.mysg
  db_username = var.db_username
  db_password = var.db_password
}
