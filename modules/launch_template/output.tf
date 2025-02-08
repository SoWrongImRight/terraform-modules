output "launch_template_id" {
  description = "ID of launch template"
  value = aws_launch_template.this.id
}

output "launch_template_arn" {
  description = "ARN of launch template"
  value = aws_launch_template.this.arn
}