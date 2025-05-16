output "asg_id" {
  description = "ID of the ASG"
  value = aws_autoscaling_group.this.id
}

output "asg_arn" {
  description = "ARN of ASG"
  value = aws_autoscaling_group.this.arn
}

output "autoscaling_group_name" {
  description = "Name of ASG"
  value = aws_autoscaling_group.this.name
}