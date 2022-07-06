variable "region" {
  type        = string
  default     = "eu-west-3"
  description = "Region to deploy infrastructure"
}
variable "rds" {
  type        = map(any)
  description = "Map of function names to configuration"
}
