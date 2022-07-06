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
// Definition of RDS
module "iam" {
  source = "./iam"

  team        = "devops"
  product     = "tools"
  environment = "production"
  department  = "tech"
}
// Definition of Security Groups
module "api-gateway" {
  source   = "./api-gateway"
  for_each = var.api-gateway

  name        = each.key
  openapi     = each.value.openapi
  domainName  = each.value.domainName
  arnCert     = each.value.arnCert
  api_key     = each.value.api_key
  team        = each.value.team
  product     = each.value.product
  environment = each.value.environment
  department  = each.value.department
  cloudwatch  = module.iam.cloudwatch
}
