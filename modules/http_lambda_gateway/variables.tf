variable "api_name" {
  type        = string
  description = "Name of the API Gateway HTTP API"
}

variable "route_key" {
  type        = string
  description = "Route key (e.g., POST /notify)"
}

variable "lambda_function_name" {
  type        = string
  description = "Name of the Lambda function"
}

variable "lambda_invoke_arn" {
  type        = string
  description = "Invoke ARN of the Lambda function"
}

variable "tags" {
  type    = map(string)
  default = {}
}
