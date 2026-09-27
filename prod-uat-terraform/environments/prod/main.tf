module "vpc" {

  source = "../../modules/vpc"

  environment = var.environment

  vpc_cidr = var.vpc_cidr

  public_subnets = [
    "10.20.1.0/24",
    "10.20.2.0/24"
  ]

  azs = [
    "ap-south-1a",
    "ap-south-1b"
  ]
}

module "ec2" {

  source = "../../modules/ec2"

  environment = var.environment

  ami_id = "ami-xxxxxxxx"

  instance_type = var.instance_type

  subnet_id = module.vpc.public_subnet_id
}

module "rds" {

  source = "../../modules/rds"

  environment = var.environment

  db_class = var.db_class

  username = local.db_secret.username

  password = local.db_secret.password

  multi_az = var.multi_az
}
