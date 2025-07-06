resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = aws_subnet.private[*].id

  tags = {
    Name        = "My RDS DB subnet group"
    Environment = var.environment
  }
}

resource "aws_db_instance" "db" {
  allocated_storage       = var.db_storage_size
  max_allocated_storage   = var.db_storage_max_size
  db_subnet_group_name    = aws_db_subnet_group.default.name
  vpc_security_group_ids  = [aws_security_group.rds.id]
  db_name                 = var.db_name
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = var.db_instance_class
  username                = var.db_username
  password                = var.db_password
  multi_az                = true
  storage_encrypted       = true
  publicly_accessible     = false
  skip_final_snapshot     = true
  backup_retention_period = 7
}
