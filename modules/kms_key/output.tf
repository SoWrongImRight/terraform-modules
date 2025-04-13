output "key_id" {
  value = aws_kms_key.this.key_id
}

output "arn" {
  value = aws_kms_key.this.arn
}

output "alias_name" {
  value = var.alias != null ? aws_kms_alias.this[0].name : null
}