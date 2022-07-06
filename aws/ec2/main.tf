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
  for_each = var.environments

  name        = each.key
  vpc_id      = each.value.vpc_id
  sg_rules    = each.value.sg_rules
  team        = each.value.team
  product     = each.value.product
  environment = each.value.environment
  department  = each.value.department
}
// Definition of EC2
module "ec2" {
  source   = "./ec2"
  for_each = var.environments

  name           = each.key
  instanceAMI    = each.value.instanceAMI
  instanceType   = each.value.instanceType
  rootVolumeSize = each.value.rootVolumeSize
  rootVolumeType = each.value.rootVolumeType
  KeyNameSSH     = each.value.KeyNameSSH
  sg_id          = module.security_groups[each.key].id
  subnet_id      = each.value.subnet_id
  team           = each.value.team
  product        = each.value.product
  environment    = each.value.environment
  department     = each.value.department
}
