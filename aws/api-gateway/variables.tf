variable "region" {
  type        = string
  default     = "eu-west-3"
  description = "Region to deploy infrastructure"
}

variable "api-gateway" {
  type        = map(any)
  description = "Map of api-gateway name to configuration"
}
