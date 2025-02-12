resource "aws_route53_record" "this" {
  for_each = var.validation_records
  zone_id = var.route53_zone_id
  name = each.value.name
  type = each.value.type
  records = [each.value.value]
  ttl = 60
}

resource "aws_route53_record" "cloudfront" {
  zone_id = var.route53_zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.cloudfront_domain_name
    zone_id                = var.route53_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloudfront_www" {
  zone_id = var.route53_zone_id
  name    = "www.${var.domain_name}"
  type    = "A"

  alias {
    name                   = var.cloudfront_domain_name
    zone_id                = var.route53_zone_id
    evaluate_target_health = false
  }
}