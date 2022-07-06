variable "name" {
  description = "Name of instance for tag"
}
variable "dbname" {
  description = "Name of database"
}
variable "instance_class" {
  description = "Type of the instance"
}
variable "allocated_storage" {
  description = "Size allocated storage"
}
variable "storage_type" {
  description = "Type storage"
}
variable "skip_final_snapshot" {
  description = "Disable snapshot before deletion"
}
variable "username" {
  description = "Username of database"
}
variable "password" {
  description = "Password of user"
}
variable "engine" {
  description = "Type of engine (MySQL/PostgreSQL/...)"
}
variable "engine_version" {
  description = "Version of the engine"
}
variable "backup_retention_period" {
  description = "Retention backup"
}
variable "backup_window" {
  description = "Hour to backup"
}
variable "maintenance_window" {
  description = "Hour to depploy maintenance"
}
variable "publicly_accessible" {
  description = "Enable accessible on public"
}
variable "copy_tags_to_snapshot" {
  description = "Enable accessible on public"
}
variable "deletion_protection" {
  description = "Enable accessible on public"
}
variable "monitoring_interval" {
  description = "Interval of monitoring"
}
variable "monitoring_role_arn" {
  description = "Role to monitor rds"
}
variable "vpc_security_group_ids" {
  description = "Security Group ID"
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
