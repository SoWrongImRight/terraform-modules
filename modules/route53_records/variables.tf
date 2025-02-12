variable "route53_zone_id" {
  description = "Route53 Hosted Zone ID where the records should be created"
  type = string
}

variable "validation_records" {
  description = "Map of domain validation records from ACM"
  type = map(object({
    name = string
    type = string
    value = string
  }))
}

variable "domain_name" {
  description = "The roote domain name"
  type = string
}

variable "cloudfront_domain_name" {
  description = "Cloudfront domain name"
  type = string
}