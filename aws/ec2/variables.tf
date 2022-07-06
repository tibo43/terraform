variable "region" {
  type        = string
  default     = "eu-west-3"
  description = "Region to deploy infrastructure"
}
variable "environments" {
  type        = map(any)
  description = "Map of environments name to configuration"
}
