variable "secret_name" {
  description = "Name fo the secret in AWS Secrets Manager"
  type = string
}

variable "description" {
  description = "Description for the secret"
  type = string
  default = "Managed by Terraform"
}

variable "secret_value" {
  description = "Sensitive secret data in JSON format"
  type = map(string)
  sensitive = true
}

variable "enable_rotation" {
  description = "Enable automatic rotation of secret"
  type = bool
  default = false
}

variable "rotation_lambda_arn" {
  description = "ARN of the AWS Lambda function used to rotate secret"
  type = string
  default = null
}

variable "rotation_days" {
  description = "Number of days before secret is automatically rotated"
  type = number
  default = 30
}