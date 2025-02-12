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