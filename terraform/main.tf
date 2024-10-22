provider "aws" {
  profile = "ktb-9"
  region  = var.region
}

module "iam_roles" {
  source = "./modules/iam_roles"
}

module "vpc" {
  source           = "./modules/vpc"
  cidr_block       = var.vpc_cidr
  vpc_name         = var.vpc_name
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  azs              = var.azs
}

module "security_groups" {
  source = "./modules/security_groups"

  vpc_id       = module.vpc.vpc_id
  cluster_name = var.cluster_name
}


module "eks" {
  source          = "./modules/eks"
  cluster_name    = var.cluster_name
  cluster_version = "1.30"

  vpc_id          = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  private_subnets = module.vpc.private_subnets

  cluster_role_arn = module.iam_roles.eks_cluster_role_arn
  node_role_arn    = module.iam_roles.eks_node_group_role_arn

  cluster_security_group = module.security_groups.eks_cluster_security_group_id
  node_security_group    = module.security_groups.eks_node_group_security_group_id

  desired_capacity = 1
  min_capacity     = 1
  max_capacity     = 3
  instance_type    = "t3.micro"
}
