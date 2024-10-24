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

resource "aws_security_group" "rds_sg" {
  vpc_id = var.vpc_id

  name        = "${var.cluster_name}-rds-sg"
  description = "Security group for RDS"

  # MySQL의 기본 포트(3306) 허용 (필요한 데이터베이스 포트로 설정 가능)
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # 접근 제한을 위해 CIDR 블록을 조정 가능
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.cluster_name}-rds-sg"
  }
}