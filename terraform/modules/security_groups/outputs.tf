output "eks_cluster_security_group_id" {
  description = "The security group ID for the EKS cluster"
  value       = aws_security_group.eks_cluster_sg.id
}

output "rds_security_group_id" {
  description = "The security group ID for RDS"
  value       = aws_security_group.rds_sg.id
}

output "ec2_instance_security_group_id" {
  description = "The security group ID for EC2 instance"
  value = aws_security_group.ec2_sg.id
}
