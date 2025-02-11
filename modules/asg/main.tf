resource "aws_autoscaling_group" "this" {
  vpc_zone_identifier = var.subnet_ids
  desired_capacity = var.desired_capacity
  min_size = var.min_size
  max_size = var.max_size
  health_check_type = "EC2"
  health_check_grace_period = 300
  force_delete = var.force_delete

  target_group_arns = var.target_group_arns

  launch_template {
    id = var.launch_template_id
    version = var.launch_template_version
  }

  lifecycle {
    create_before_destroy = true
  }


  dynamic "tag" {
    for_each = var.tags
    content {
      key = tag.key
      value = tag.value
      propagate_at_launch = true
    }
  }
}