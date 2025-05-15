variable "asg_name" {
  description = "Name of the Auto Scaling Group to target"
  type        = string
}

variable "fis_role_arn" {
  description = "IAM role ARN for FIS to assume"
  type        = string
}

variable "tag_key" {
  default = "Experiment"
  type    = string
}

variable "tag_value" {
  default = "ready"
  type    = string
}

variable "enable_report" {
  type    = bool
  default = false
}

variable "report_s3_bucket" {
  type    = string
  default = null
}
