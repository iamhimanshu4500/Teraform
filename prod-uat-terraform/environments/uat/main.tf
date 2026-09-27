module "vpc" {
  source = "../../modules/vpc"

  environment = var.environment
  cidr_block  = var.vpc_cidr
}

module "ec2" {
  source = "../../modules/ec2"

  environment   = var.environment
  instance_type = var.instance_type
}

module "rds" {
  source = "../../modules/rds"

  environment = var.environment
  db_class    = var.db_class
  multi_az    = var.multi_az

  username = local.db_secret.username
  password = local.db_secret.password
}
