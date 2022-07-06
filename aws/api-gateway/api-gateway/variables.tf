variable "name" {
}
variable "openapi" {
}
variable "api_key" {
}
variable "domainName" {
}
variable "arnCert" {
}
variable "stage_name" {
}
variable "route53_zone_id" {
}
variable "quota_limit" {
  default = 100
}
variable "quota_offset" {
  default = 0
}
variable "quota_period" {
  default = "DAY"
}
variable "burst_limit" {
  default = 100
}
variable "rate_limit" {
  default = 100
}
variable "metrics_enabled" {
  default = true
}
variable "logging_level" {
  default = "INFO"
}
variable "data_trace_enabled" {
  default = true
}
variable "throttling_burst_limit" {
  default = 100
}
variable "throttling_rate_limit" {
  default = 100
}
variable "cloudwatch" {
}
variable "team" {
  description = "Define team name for identification"
}
variable "product" {
  description = "Define product name for identification"
}
variable "environment" {
  description = "Define environment type for identification"
}
variable "department" {
  description = "Define department name for identification"
}
