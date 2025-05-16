output "role_arn" {
  value = aws_iam_role.this.arn
}

output "instance_profile_name" {
  value       = try(aws_iam_instance_profile.this[0].name, null)
  description = "Name of the instance profile (if created)"
}

output "role_name" {
  value = aws_iam_role.this.name
}
