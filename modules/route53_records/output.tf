output "route53_record_names" {
  description = "List of created Route53 record names"
  value = [for r in aws_route53_record.this : r.name]
}

output "route53_record_values" {
  description = "List of Route53 record values"
  value = [ for r in aws_route53_record.this : r.records ]
}

output "domain_name" {
  description = "Domain name for website"
  value = var.domain_name
}

output "www_domain_name" {
  description = "The wwww subdomain"
  value = "wwww.${var.domain_name}"
}