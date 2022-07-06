resource "aws_api_gateway_rest_api" "api" {
  name = var.name

  body = file(var.openapi)
  endpoint_configuration {
    types = ["REGIONAL"]
  }
  tags = {
    Team        = "${var.team}"
    Product     = "${var.product}"
    Department  = "${var.department}"
    Environment = "${var.environment}"
  }
}

resource "aws_api_gateway_deployment" "api_deployment" {
  rest_api_id = aws_api_gateway_rest_api.api.id

  triggers = {
    redeployment = sha1(aws_api_gateway_rest_api.api.body)
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "api_stage" {
  deployment_id = aws_api_gateway_deployment.api_deployment.id
  rest_api_id   = aws_api_gateway_rest_api.api.id
  stage_name    = var.stage_name


  depends_on = [aws_cloudwatch_log_group.cloudwatch]

  tags = {
    Team        = "${var.team}"
    Product     = "${var.product}"
    Department  = "${var.department}"
    Environment = "${var.environment}"
  }
}

resource "aws_api_gateway_method_settings" "api_method_settings" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  stage_name  = aws_api_gateway_stage.api_stage.stage_name
  method_path = "*/*"

  settings {
    metrics_enabled        = var.metrics_enabled
    logging_level          = var.logging_level
    data_trace_enabled     = var.data_trace_enabled
    throttling_burst_limit = var.throttling_burst_limit
    throttling_rate_limit  = var.throttling_rate_limit
  }
}

resource "aws_api_gateway_usage_plan" "usage_plan" {
  name = var.name

  api_stages {
    api_id = aws_api_gateway_rest_api.api.id
    stage  = aws_api_gateway_stage.api_stage.stage_name
  }

  quota_settings {
    limit  = var.quota_limit
    offset = var.quota_offset
    period = var.quota_period
  }

  throttle_settings {
    burst_limit = var.burst_limit
    rate_limit  = var.rate_limit
  }
}

resource "aws_api_gateway_api_key" "api_key" {
  name = var.api_key
}

resource "aws_api_gateway_usage_plan_key" "usage_plan_key" {
  key_id        = aws_api_gateway_api_key.api_key.id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.usage_plan.id
}

resource "aws_api_gateway_base_path_mapping" "api_path_mapping" {
  api_id      = aws_api_gateway_rest_api.api.id
  domain_name = aws_api_gateway_domain_name.api_domain_name.domain_name
  stage_name  = aws_api_gateway_stage.api_stage.stage_name
}

resource "aws_api_gateway_account" "api_account" {
  cloudwatch_role_arn = var.cloudwatch
}

resource "aws_api_gateway_domain_name" "api_domain_name" {
  domain_name              = var.domainName
  regional_certificate_arn = var.arnCert

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_cloudwatch_log_group" "cloudwatch" {
  name              = "API-Gateway/${var.name}/${var.stage_name}"
  retention_in_days = 7
}

resource "aws_route53_record" "route53_record" {
  name    = aws_api_gateway_domain_name.api_domain_name.domain_name
  type    = "A"
  zone_id = var.route53_zone_id

  alias {
    evaluate_target_health = true
    name                   = aws_api_gateway_domain_name.api_domain_name.regional_domain_name
    zone_id                = aws_api_gateway_domain_name.api_domain_name.regional_zone_id
  }
}
