api-gateway = {
  api = {
    openapi         = "./openapi/tools-api.json"
    stage_name      = "Production"
    route53_zone_id = "{aws_zone_id}"
    domainName      = "api.exemple.tf"
    arnCert         = "arn:aws:acm:{aws_region}:{aws_account}:certificate/{aws_certificate_id}"
    api_key         = "x-api-key"
    team            = "devops"
    product         = "tools"
    environment     = "production"
    department      = "tech"
  }
}
