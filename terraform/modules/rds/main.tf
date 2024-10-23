# RDS Subnet Group
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = var.subnet_group_name
  subnet_ids = var.subnet_ids

  tags = {
    Name = var.subnet_group_name
  }
}

# RDS 인스턴스 생성
resource "aws_db_instance" "rds_instance" {
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  identifier           = var.db_identifier  # 인스턴스의 고유 식별자
  db_name              = var.db_name        # 초기화할 데이터베이스 이름
  username             = var.username
  password             = var.password
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  skip_final_snapshot  = var.skip_final_snapshot
  apply_immediately    = true
  vpc_security_group_ids = var.vpc_security_group_ids
  
  tags = {
    Name = var.db_name
  }
}
