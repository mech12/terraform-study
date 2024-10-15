module "my-vpc" {
  source = "./vpc"

  vpc_name = "t101-study-week-layout"
}

module "my-db" {
  source     = "./db"
  depends_on = [module.my-vpc]

  subnet1        = module.my-vpc.mysubnet3
  subnet2        = module.my-vpc.mysubnet4
  security_group = module.my-vpc.mysg
  db_username    = var.db_username
  db_password    = var.db_password
}

module "my-service" {
  source     = "./service"
  depends_on = [module.my-vpc, module.my-db]

  # vpc_id = module.my-vpc.my_vpc_id
  # db_address = module.my-db.db_address
  # db_port = module.my-db.db_port
  vpc_id     = data.terraform_remote_state.dev_remote.outputs.my_vpc_id
  db_address = data.terraform_remote_state.dev_remote.outputs.db_address
  db_port    = data.terraform_remote_state.dev_remote.outputs.db_port
}
