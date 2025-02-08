output "security_group_id" {
  description = "ID of SG"
  value = aws_security_group.this.id
}