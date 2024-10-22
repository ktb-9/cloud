# EKS 클러스터용 보안 그룹
resource "aws_security_group" "eks_cluster_sg" {
  vpc_id = var.vpc_id

  name        = "${var.cluster_name}-sg"
  description = "Security group for EKS cluster"

  # 클러스터 API 서버에 대한 접근 (HTTPS)
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # 필요 시 더 제한할 수 있음
  }

  # 아웃바운드 트래픽 허용 (모든 아웃바운드 트래픽)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.cluster_name}-sg"
  }
}

# EKS 노드 그룹용 보안 그룹
resource "aws_security_group" "eks_node_group_sg" {
  vpc_id = var.vpc_id

  name        = "${var.cluster_name}-node-group-sg"
  description = "Security group for EKS worker nodes"

  # 노드 그룹의 기본 포트 (Kubernetes API 서버 통신)
  ingress {
    from_port   = 1025
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # 노드 그룹의 아웃바운드 트래픽 (모든 아웃바운드 허용)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.cluster_name}-node-group-sg"
  }
}
