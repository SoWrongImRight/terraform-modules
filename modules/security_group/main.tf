locals {
    http_port = 80
    https_port = 443
    any_port = 0
    any_protocol = "-1"
    tcp_protocol = "tcp"
    all_ips = ["0.0.0.0/0"]
    ssh = 22

    cloudfront_ips = [
      "13.32.0.0/15",
      "13.35.0.0/16",
      "13.54.63.128/26",
      "13.59.250.0/26",
      "52.46.0.0/18",
      "52.84.0.0/15",
      "54.182.0.0/16",
      "54.192.0.0/16",
      "54.230.0.0/16",
      "54.239.128.0/18",
      "204.246.164.0/22",
      "204.246.168.0/22",
      "204.246.174.0/23",
      "204.246.176.0/20"
    ]
}

resource "aws_security_group" "this" {
  name = var.sg_name
  description = var.sg_description
  vpc_id = var.vpc_id

  tags = var.tags
}

resource "aws_security_group_rule" "allow_http_inbound" {
  type = "ingress"
  security_group_id = aws_security_group.this.id

  from_port = local.http_port
  to_port = local.http_port
  protocol = local.tcp_protocol
  cidr_blocks = local.all_ips
}

resource "aws_security_group_rule" "allow_https_cloudfront" {
  type              = "ingress"
  security_group_id = aws_security_group.this.id
  from_port         = local.https_port
  to_port           = local.https_port
  protocol          = local.tcp_protocol
  cidr_blocks       = local.cloudfront_ips 
}

resource "aws_security_group_rule" "allow_all_outbound" {
  type = "egress"
  security_group_id = aws_security_group.this.id

  from_port = local.any_port
  to_port = local.any_port
  protocol = local.any_protocol
  cidr_blocks = local.all_ips
}