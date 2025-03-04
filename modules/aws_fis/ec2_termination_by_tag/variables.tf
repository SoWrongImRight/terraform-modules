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