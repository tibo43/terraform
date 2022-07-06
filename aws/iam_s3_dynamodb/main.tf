terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.4"
    }
  }
  backend "s3" {}
}

provider "aws" {
  region = var.region
}

module "iam" {
  source   = "./iam"
  for_each = var.environments

  name        = each.key
  region      = var.region
  team        = each.value.team
  product     = each.value.product
  environment = each.value.environment
  department  = each.value.department
}

module "s3" {
  source   = "./s3"
  for_each = var.environments

  name                    = each.key
  block_public_acls       = each.value.block_public_acls
  block_public_policy     = each.value.block_public_policy
  ignore_public_acls      = each.value.ignore_public_acls
  restrict_public_buckets = each.value.restrict_public_buckets
  team                    = each.value.team
  product                 = each.value.product
  environment             = each.value.environment
  department              = each.value.department
}
