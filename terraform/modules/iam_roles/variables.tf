variable "eks_cluster_role_name" {
  description = "IAM Role name for EKS Cluster"
  type        = string
  default     = "ktb9-eks-cluster-role"
}

variable "eks_node_group_role_name" {
  description = "IAM Role name for EKS Node Group"
  type        = string
  default     = "ktb9-eks-node-group-role"
}
