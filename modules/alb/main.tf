resource "aws_lb" "this" {
  name = var.lb_name
  internal = var.internal
  load_balancer_type = var.lb_type
  security_groups = var.security_group_ids
  subnets = var.subnet_ids

  enable_deletion_protection = false

  tags = var.tags
}

resource "aws_lb_target_group" "this" {
  name = var.target_group_name
  port = var.target_group_port
  protocol = var.target_group_protocol
  vpc_id = var.vpc_id

  health_check {
    path = var.health_check_path
    interval = 30
    timeout = 5
    healthy_threshold = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = var.target_group_name
    Environment = var.environment
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port = 443
  protocol = "HTTPS"

  ssl_policy = "ELBSecurityPolicy-2016-08"
  certificate_arn = var.acm_certificate_arn

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}