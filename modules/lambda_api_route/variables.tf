variable "api_id" {
  type        = string
  description = "ID of the API Gateway HTTP API"
}

variable "api_execution_arn" {
  type        = string
  description = "Execution ARN of the API Gateway HTTP API"
}

variable "route_key" {
  type        = string
  description = "Route key (e.g., POST /notify)"
}

variable "lambda_function_name" {
  type        = string
  description = "Lambda function name"
}

variable "lambda_invoke_arn" {
  type        = string
  description = "Lambda invoke ARN"
}
