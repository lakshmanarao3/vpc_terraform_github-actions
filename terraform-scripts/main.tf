module "vpc" {
  source      = "./modules/vpc"
  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
}

module "security_group" {
  source    = "./modules/sg"
  vpc_id    = module.vpc.vpc_id
  my-pub-ip = var.my-pub-ip
}

module "ec2" {
  source    = "./modules/ec2"
  sgs_id    = module.security_group.sg_id
  subnets   = module.vpc.subnet_ids
  public-key = var.public_key
}

module "alb" {
  source  = "./modules/alb"
  sg-id   = module.security_group.sg_id
  subnets = module.vpc.subnet_ids
  vpc-id  = module.vpc.vpc_id
  ec2-ids = module.ec2.ec2_ids
}