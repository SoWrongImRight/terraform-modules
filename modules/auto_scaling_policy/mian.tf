resource "aws_autoscaling_policy" "target_tracking" {
  name                   = var.policy_name
  autoscaling_group_name = var.autoscaling_group_name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = var.predefined_metric_type
    }

    target_value               = var.target_value
  }
}
