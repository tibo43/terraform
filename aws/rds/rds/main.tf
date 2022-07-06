// Definition of rds instance
resource "aws_db_instance" "rds" {
  identifier                = var.name
  db_name                   = var.dbname
  instance_class            = var.instance_class
  allocated_storage         = var.allocated_storage
  username                  = var.username
  password                  = var.password
  final_snapshot_identifier = "${var.name}-final-snapshot"
  skip_final_snapshot       = var.skip_final_snapshot
  engine                    = var.engine
  engine_version            = var.engine_version
  backup_retention_period   = var.backup_retention_period
  backup_window             = var.backup_window
  maintenance_window        = var.maintenance_window
  publicly_accessible       = var.publicly_accessible
  copy_tags_to_snapshot     = var.copy_tags_to_snapshot
  deletion_protection       = var.deletion_protection
  storage_type              = var.storage_type
  monitoring_interval       = var.monitoring_interval
  monitoring_role_arn       = var.monitoring_role_arn
  vpc_security_group_ids    = [var.vpc_security_group_ids]
  tags = {
    Team        = "${var.team}"
    Product     = "${var.product}"
    Department  = "${var.department}"
    Environment = "${var.environment}"
  }
}
