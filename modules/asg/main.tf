resource "aws_autoscaling_group" "this" {
  vpc_zone_identifier = var.subnet_ids
  desired_capacity = var.desired_capacity
  min_size = var.min_size
  max_size = var.max_size
  health_check_type = "EC2"
  force_delete = var.force_delete

  launch_template {
    id = var.launch_template_id
    version = var.launch_template_version
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