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
