output "cloudfront_dns" {
  description = "Cloudfront DNS name"
  value = aws_cloudfront_distribution.this.domain_name
}

output "cloudfront_domain_name" {
  description = "Domain name assigned to Cloudfront distribution"
  value = aws_cloudfront_distribution.this.domain_name
}

output "cloudfront_hosted_zone_id" {
  description = "Hosted zone ID for cloudfront"
  value = aws_cloudfront_distribution.this.hosted_zone_id
}