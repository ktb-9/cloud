variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "The version of the EKS cluster"
  type        = string
  default     = "1.31"
}

variable "vpc_id" {
  description = "VPC ID where the EKS cluster will be deployed"
  type        = string
}

variable "public_subnets" {
  description = "Public subnets in the VPC"
  type        = list(string)
}

variable "private_subnets" {
  description = "Private subnets in the VPC"
  type        = list(string)
}

variable "cluster_role_arn" {
  description = "IAM role ARN for EKS cluster"
  type        = string
}

variable "node_role_arn" {
  description = "IAM role ARN for the node group"
  type        = string
}

variable "desired_capacity" {
  description = "The desired number of worker nodes"
  type        = number
  default     = 1
}

variable "min_capacity" {
  description = "The minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "max_capacity" {
  description = "The maximum number of worker nodes"
  type        = number
  default     = 3
}

variable "instance_type" {
  description = "EC2 instance type for worker nodes"
  type        = string
  default     = "t3.medium"
}

# 클러스터 보안 그룹
variable "cluster_security_group" {
  description = "Security group ID for the EKS cluster"
  type        = string
}
