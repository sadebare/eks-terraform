module "vpc" {
  source          = "../../modules/vpc"
  env_name        = var.env_name
  vpc_cidr        = var.vpc_cidr
  private_subnets = var.private_subnet_cidr
  public_subnets  = var.public_subnet_cidr
  number_of_nat   = var.number_of_nat
}