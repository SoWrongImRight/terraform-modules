variable "role_name" {
  description = "Name of the IAM role to create for FIS"
  type        = string
}

variable "s3_bucket_arn" {
  description = "Optional S3 bucket ARN for experiment reports"
  type        = string
  default     = null
}

variable "include_ssm_permissions" {
  description = "Whether to include SSM permissions (e.g. for stress testing)"
  type        = bool
  default     = false
}
