variable "domain_name" {
  description = "Domain name for SSL certificate"
  type = string
}

/* variable "route53_zone_id" {
  description = "Route 53 Hosted Zone ID"
  type        = string
} */

variable "san_list" {
  description = "List of Subject Alternative Names (SANs)"
  type        = list(string)
  default     = []
}