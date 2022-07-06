terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.4"
    }
  }
  backend "s3" {}
}

// Definition of provider and the region
provider "aws" {
  region = var.region
}
// Definition of Security Groups
module "security_groups" {
  source   = "./security-groups"
  for_each = var.rds

  name        = each.key
  vpc_id      = each.value.vpc_id
  sg_rules    = each.value.sg_rules
  team        = each.value.team
  product     = each.value.product
  environment = each.value.environment
  department  = each.value.department
}
// Definition of RDS
module "rds" {
  source   = "./rds"
  for_each = var.rds

  name                    = each.key
  dbname                  = each.value.dbname
  instance_class          = each.value.instance_class
  allocated_storage       = each.value.allocated_storage
  storage_type            = each.value.storage_type
  username                = each.value.username
  password                = each.value.password
  skip_final_snapshot     = each.value.skip_final_snapshot
  engine                  = each.value.engine
  engine_version          = each.value.engine_version
  backup_retention_period = each.value.backup_retention_period
  backup_window           = each.value.backup_window
  maintenance_window      = each.value.maintenance_window
  publicly_accessible     = each.value.publicly_accessible
  copy_tags_to_snapshot   = each.value.copy_tags_to_snapshot
  deletion_protection     = each.value.deletion_protection
  monitoring_interval     = each.value.monitoring_interval
  monitoring_role_arn     = each.value.monitoring_role_arn
  team                    = each.value.team
  product                 = each.value.product
  environment             = each.value.environment
  department              = each.value.department
  vpc_security_group_ids  = module.security_groups[each.key].id
}
