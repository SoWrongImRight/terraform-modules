resource "aws_route53_record" "this" {
  for_each = var.validation_record
  zone_id = var.route53_zone_id
  name = each.value.name
  type = each.value.type
  records = [each.value.value]
  ttl = 60
}