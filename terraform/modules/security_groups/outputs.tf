output "eks_cluster_security_group_id" {
  description = "The security group ID for the EKS cluster"
  value       = aws_security_group.eks_cluster_sg.id
}

output "eks_node_group_security_group_id" {
  description = "The security group ID for the EKS node group"
  value       = aws_security_group.eks_node_group_sg.id
}
