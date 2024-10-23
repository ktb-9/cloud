variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket"
}

variable "environment" {
  type        = string
  description = "The environment tag for the S3 bucket"
}

variable "block_public_acls" {
  type        = bool
  description = "Block public ACLs"
  default     = false
}

variable "block_public_policy" {
  type        = bool
  description = "Block public policy"
  default     = false
}

variable "ignore_public_acls" {
  type        = bool
  description = "Ignore public ACLs"
  default     = false
}

variable "restrict_public_buckets" {
  type        = bool
  description = "Restrict public buckets"
  default     = false
}

variable "bucket_policy" {
  type        = string
  description = "The S3 bucket policy"
}
