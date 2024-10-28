# 리전
variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "ap-northeast-2"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "ktb9-vpc"
}

variable "public_subnets" {
  description = "Public subnets in different availability zones"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "Private subnets in different availability zones"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "azs" {
  description = "Availability zones for subnets"
  type        = list(string)
  default     = ["ap-northeast-2a", "ap-northeast-2c"]
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "ktb9-eks-cluster"
}

variable "subnet_group_name" {
  description = "The name of the RDS subnet group"
  type = string
  default = "ktb9-rds-subnet-group"
}

variable "allocated_storage" {
  description = "The allocated storage size for RDS"
  type        = number
  default     = 20
}

variable "engine" {
  description = "The database engine for RDS"
  type        = string
  default     = "mysql"
}

variable "db_identifier" {
  description = "The unique identifier for the RDS instance"
  type        = string
  default     = "ktb9-rds-instance"
}

variable "db_name" {
  description = "The name of the database for RDS"
  type        = string
  default     = "ktb9db"
}

variable "username" {
  description = "The username for the RDS database"
  type        = string
}

variable "password" {
  description = "The password for the RDS database"
  type        = string
}

variable "ec2_instance_type" {
  description = "The type of instance to use"
  default     = "t2.micro"
}

variable "ami" {
  description = "The AMI to use for the instances"
  default     = "ami-02c329a4b4aba6a48"
}

variable "key_name" {
  description = "The name of the SSH key pair to use for the instance"
  type        = string
  default     = "ktb9-travel-key"
}