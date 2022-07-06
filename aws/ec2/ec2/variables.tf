variable "name" {
  description = "Name of instance for tag"
}
variable "instanceAMI" {
  description = "AMI for the instance"
}
variable "instanceType" {
  description = "Type of the instance"
}
variable "rootVolumeSize" {
  description = "Size root volume"
}
variable "rootVolumeType" {
  description = "Type root volume"
}
variable "KeyNameSSH" {
  description = "SSH key"
}
variable "sg_id" {
  description = "Security Group ID"
}
variable "subnet_id" {
  description = "Subnet ID"
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
