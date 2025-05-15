resource "aws_fis_experiment_template" "test_asg_termination" {
  description = "Terminate a portion of EC2 instances in ASG ${var.asg_name} to test auto scaling recovery"
  role_arn    = var.fis_role_arn

  stop_condition {
    source = "none"
  }

  action {
    name      = "terminate-instances"
    action_id = "aws:ec2:terminate-instances"
    target {
      key   = "Instances"
      value = "target-instances"
    }
  }

  target {
    name           = "target-instances"
    resource_type  = "aws:ec2:instance"
    selection_mode = "PERCENT(50)"

    resource_tag {
      key   = var.tag_key
      value = var.tag_value
    }
  }

  dynamic "experiment_report_configuration" {
    for_each = var.enable_report ? [1] : []
    content {
      outputs {
        s3_configuration {
          bucket_name = var.report_s3_bucket
          prefix      = "fis-asg-test"
        }
      }
    }
  }
}
