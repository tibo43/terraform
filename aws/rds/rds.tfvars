rds = {
  blog = {
    dbname                  = "blog"
    instance_class          = "db.t2.micro"
    username                = "blog"
    password                = "{aws_rds_root_password}"
    backup_retention_period = 30
    engine                  = "mysql"
    engine_version          = "8.0.27"
    allocated_storage       = 10
    storage_type            = "gp2"
    skip_final_snapshot     = false
    backup_window           = "01:30-02:00"
    maintenance_window      = "Mon:03:30-Mon:04:00"
    publicly_accessible     = "true"
    copy_tags_to_snapshot   = true
    deletion_protection     = true
    monitoring_interval     = 60
    monitoring_role_arn     = "arn:aws:iam::{aws_account}:role/{aws_monitoring_role_arn}"
    vpc_id                  = "{aws_vpc_id}"
    sg_rules = [
      {
        type        = "ingress"
        from_port   = 3306
        to_port     = 3306
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
        description = "INPUT: MySQL port"
      },
      {
        type        = "egress"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_block  = "0.0.0.0/0"
        description = "OUTPUT: ALL"
      }
    ]
    team        = "market"
    product     = "blog"
    environment = "production"
    department  = "growth"
  },
  test-production = {
    dbname                  = "test"
    instance_class          = "db.t3.xlarge"
    username                = "test"
    password                = "{aws_rds_root_password}"
    backup_retention_period = 30
    engine                  = "postgres"
    engine_version          = "14.2"
    allocated_storage       = 200
    storage_type            = "gp2"
    skip_final_snapshot     = false
    backup_window           = "01:30-02:00"
    maintenance_window      = "Mon:03:30-Mon:04:00"
    publicly_accessible     = "true"
    copy_tags_to_snapshot   = true
    deletion_protection     = true
    monitoring_interval     = 60
    monitoring_role_arn     = "arn:aws:iam::{aws_account}:role/{aws_monitoring_role_arn}"
    vpc_id                  = "{aws_vpc_id}"
    sg_rules = [
      {
        type        = "ingress"
        from_port   = 5432
        to_port     = 5432
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
        description = "INPUT: PostgreSQL port"
      },
      {
        type        = "egress"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_block  = "0.0.0.0/0"
        description = "OUTPUT: ALL"
      }
    ]
    team        = "data"
    product     = "produit"
    environment = "production"
    department  = "tech"
  }
  test-staging = {
    dbname                  = "test"
    instance_class          = "db.t3.small"
    username                = "test"
    password                = "{aws_rds_root_password}"
    backup_retention_period = 7
    engine                  = "postgres"
    engine_version          = "14.2"
    allocated_storage       = 20
    storage_type            = "gp2"
    skip_final_snapshot     = false
    backup_window           = "01:30-02:00"
    maintenance_window      = "Mon:03:30-Mon:04:00"
    publicly_accessible     = "true"
    copy_tags_to_snapshot   = true
    deletion_protection     = false
    monitoring_interval     = 60
    monitoring_role_arn     = "arn:aws:iam::{aws_account}:role/{aws_monitoring_role_arn}"
    vpc_id                  = "{aws_vpc_id}"
    sg_rules = [
      {
        type        = "ingress"
        from_port   = 5432
        to_port     = 5432
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
        description = "INPUT: PostgreSQL port"
      },
      {
        type        = "egress"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_block  = "0.0.0.0/0"
        description = "OUTPUT: ALL"
      }
    ]
    team        = "data"
    product     = "produit"
    environment = "staging"
    department  = "tech"
  }
}
