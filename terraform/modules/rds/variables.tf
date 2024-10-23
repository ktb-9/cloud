variable "subnet_group_name" {
  type        = string
  description = "The name of the RDS subnet group"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for the RDS subnet group"
}

variable "allocated_storage" {
  type        = number
  description = "The amount of allocated storage in GB"
}

variable "engine" {
  type        = string
  description = "The database engine (e.g., MySQL, PostgreSQL)"
}

variable "engine_version" {
  type        = string
  description = "The version of the database engine"
}

variable "instance_class" {
  type        = string
  description = "The instance class for the RDS instance"
}

variable "db_identifier" {
  description = "The identifier for the RDS instance"
  type        = string
}

variable "db_name" {
  description = "The name of the database to be created"
  type        = string
}


variable "username" {
  type        = string
  description = "The database admin username"
}

variable "password" {
  type        = string
  description = "The password for the database admin"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "List of VPC security group IDs for the RDS instance"
}

variable "skip_final_snapshot" {
  type        = bool
  description = "Whether to skip the final snapshot"
  default     = true
}
