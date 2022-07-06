variable "region" {
  type        = string
  default     = "eu-west-3"
  description = "Region to deploy infrastructure"
}

variable "iam_s3" {
  type        = map(any)
  description = "Map of iam_s3 name to configuration"
}
