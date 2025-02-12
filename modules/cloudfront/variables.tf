variable "acm_certificate_arn" {
  description = "ARN of ACM cert"
  type = string
}

variable "alb_dns_name" {
  description = "DNS name of load balancer"
  type = string
}

variable "aliases" {
  description = "Aliases to be added to Route53 DNS records"
  type = list(string)
  default = []
}