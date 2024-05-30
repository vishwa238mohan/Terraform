provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "./modules/vpc"
  cidr_block = var.cidr_block
}

module "subnets" {
  source = "./modules/subnets"
  vpc_id = module.vpc.vpc_id
  public_subnet = var.public_subnet
  private_subnet = var.private_subnet
}

module "internet_gateway" {
  source = "./modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
}

module "nat_gateway" {
  source = "./modules/nat_gateway"
  private_subnet_ids = module.subnets.private_subnet_ids
}

module "route_table" {
  source = "./modules/route_table"
  vpc_id = module.vpc.vpc_id
  internet_gateway_id = module.internet_gateway.internet_gateway_id
  public_subnet_ids = module.subnets.public_subnet_ids
  private_subnet_ids = module.subnets.private_subnet_ids
  nat_gateway_id = module.nat_gateway.nat_gateway_ids
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "./modules/ec2"
  ami_id = var.ami_id
  instance_type = var.instance_type
  subnet_id = element(module.subnets.public_subnet_ids, 0)
  key_name = var.key_name
  security_group_id = module.security_group.security_group_id
}

module "load_balancer" {
  source = "./modules/load_balancer"
  subnet_ids = module.subnets.public_subnet_ids
  security_groups = [module.security_group.security_group_id]
}

module "autoscaling" {
  source = "./modules/autoscaling"
  ami_id = var.ami_id
  instance_type = var.instance_type
  security_group_ids = [module.security_group.security_group_id]
  subnet_ids = module.subnets.private_subnet_ids
  min_size = 1
  max_size = 3
  desired_capacity = 1
  scale_up_adjustment = 1
  scale_down_adjustment = -1
  cooldown = 300
}