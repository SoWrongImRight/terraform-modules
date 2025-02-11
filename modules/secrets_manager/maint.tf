resource "aws_secretsmanager_secret" "this" {
  name = var.secret_name
  description = var.description
}

resource "aws_secretsmanager_secret_version" "this" {
  secret_id = aws_secretsmanager_secret.this.id
  secret_string = jsonencode(var.secret_value)
}

resource "aws_secretsmanager_secret_rotation" "this" {
  count = var.enable_rotation ? 1 : 0
  secret_id = aws_secretsmanager_secret.this.id
  rotation_lambda_arn = var.rotation_lambda_arn
  rotation_rules {
    automatically_after_days = var.rotation_days
  }
}