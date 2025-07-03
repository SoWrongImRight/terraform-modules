resource "aws_lambda_function" "this" {
  function_name    = var.function_name
  role             = var.iam_role_arn
  handler          = var.handler
  runtime          = var.runtime
  filename         = var.filename
  source_code_hash = var.source_code_hash
  memory_size      = var.memory_size
  timeout          = var.timeout

  environment {
    variables = var.environment_variables
  }

  dynamic "vpc_config" {
    for_each = var.vpc_config != null ? [1] : []
    content {
      subnet_ids         = var.vpc_config.subnet_ids
      security_group_ids = var.vpc_config.security_group_ids
    }
  }

  tags = var.tags
}
