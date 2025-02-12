output "certificate_arn" {
  description = "ARN of certificate"
  value = aws_acm_certificate.this.arn
}

output "domain_validation_options" {
  description = "Domain validation records required for Route 53"
  value       = aws_acm_certificate.this.domain_validation_options
}
