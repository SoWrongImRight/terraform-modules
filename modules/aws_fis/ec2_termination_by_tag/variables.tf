variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "tag_key" {
  description = "Key of tag used"
  type        = string
}

variable "tag_value" {
  description = "Value of key from tag"
  type        = string
}

variable "fis_role_arn" {
  description = "ARN of IAM role for FIS"
  type        = string
}

variable "enable_experiment_report" {
  description = "Enable experiment report configuratiohn"
  type = bool
  default = false
}

variable "report_s3_bucket_name" {
  description = "S3 bucket name for FIS reports"
  type = string
  default = null
}

variable "report_dashboard_arn" {
  description = "Cloudwatch dashboard ARN for FIS experiment" 
  type = string
  default = null
}