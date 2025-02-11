output "secret_arn" {
  description = "ARN of AWS Secret Manager secret"
  value = aws_secretsmanager_secret.this.arn
}

output "secret_id" {
  description = "ID of the AWS Secret Manager secret"
  value = aws_secretsmanager_secret.this.id
}