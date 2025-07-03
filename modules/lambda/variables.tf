variable "function_name" {
  type        = string
  description = "Lambda function name"
}

variable "filename" {
  type        = string
  description = "Path to ZIP file with Lambda code"
}

variable "source_code_hash" {
  type        = string
  description = "Base64-encoded SHA256 hash of the ZIP"
}

variable "handler" {
  type        = string
  description = "Lambda handler (e.g. index.handler)"
}

variable "runtime" {
  type        = string
  default     = "nodejs18.x"
  description = "Lambda runtime"
}

variable "timeout" {
  type        = number
  default     = 10
}

variable "memory_size" {
  type        = number
  default     = 128
}

variable "environment_variables" {
  type        = map(string)
  default     = {}
}

variable "vpc_config" {
  type = object({
    subnet_ids         = list(string)
    security_group_ids = list(string)
  })
  default = null
}

variable "iam_role_arn" {
  type        = string
  description = "IAM role ARN for Lambda execution"
}

variable "tags" {
  type    = map(string)
  default = {}
}
