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

  vpc_id          = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  private_subnets = module.vpc.private_subnets

  cluster_role_arn = module.iam_roles.eks_cluster_role_arn
  node_role_arn    = module.iam_roles.eks_node_group_role_arn

  cluster_security_group = module.security_groups.eks_cluster_security_group_id
}

module "s3_bucket" {
  source = "./modules/s3"

  bucket_name            = "ktb9-bucket"
  environment            = "devel"
  block_public_acls      = false
  block_public_policy    = false
  ignore_public_acls     = false
  restrict_public_buckets = false
  bucket_policy = <<POLICY
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Sid":"PublicRead",
      "Effect":"Allow",
      "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::ktb9-bucket/*"]
    }
  ]
}
POLICY
}

module "rds_instance" {
  source = "./modules/rds"

  subnet_group_name = var.subnet_group_name
  subnet_ids = module.vpc.private_subnets
  allocated_storage = 20
  engine = var.engine
  engine_version = "8.0"
  instance_class = "db.t3.micro"
  db_identifier  = var.db_identifier
  db_name = var.db_name
  username = var.username
  password = var.password
  vpc_security_group_ids = [module.security_groups.rds_security_group_id]  # 보안 그룹 ID 추가
}

module "ec2" {
  source               = "./modules/ec2"
  ec2_instance_type        = var.ec2_instance_type
  ami               = var.ami
  subnet_id            = module.vpc.public_subnets[0]
  instance_security_group   = module.security_groups.ec2_instance_security_group_id
  key_name             = var.key_name
}
