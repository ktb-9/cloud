resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids = var.private_subnets
    security_group_ids = [var.cluster_security_group]
#     endpoint_public_access = true      # 퍼블릭 접근 활성화 -> EKS 클러스터의 API 서버가 퍼블릭 인터넷에서 접근 가능
#     endpoint_private_access = true      # 프라이빗 접근 활성화 -> VPC 내부에서만 클러스터 API 서버에 접근 가능
  }

  version = var.cluster_version

  # 지원 옵션 (표준 지원)
  tags = {
    SupportLevel = "Standard"
  }

}
resource "aws_eks_addon" "eks_cni" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  addon_name      = "vpc-cni"
  addon_version   = "v1.18.3-eksbuild.2"
  resolve_conflicts_on_create = "OVERWRITE"
}

resource "aws_eks_addon" "eks_proxy" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  addon_name      = "kube-proxy"
  addon_version   = "v1.31.0-eksbuild.2"
  resolve_conflicts_on_create = "OVERWRITE"
}

resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${var.cluster_name}-node-group"
  node_role_arn   = var.node_role_arn
  subnet_ids         = var.private_subnets

  capacity_type   = "ON_DEMAND"
  disk_size       = 20
  instance_types = [var.instance_type]

  scaling_config {
    desired_size = var.desired_capacity
    max_size     = var.max_capacity
    min_size     = var.min_capacity
  }

  tags = {
    Name = "${var.cluster_name}-node-group"
  }
}
