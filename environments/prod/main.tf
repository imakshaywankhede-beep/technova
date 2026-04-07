module "vpc" {
  source     = "../../modules/vpc"
  cidr_block = "10.0.0.0/16"
}

module "sg" {
  source = "../../modules/sg"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "../../modules/ec2"

  public_subnet  = module.vpc.public_subnet
  private_subnet = module.vpc.private_subnet
  bastion_sg     = module.sg.bastion_sg
  app_sg         = module.sg.app_sg
}