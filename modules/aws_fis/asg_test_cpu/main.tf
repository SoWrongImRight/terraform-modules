data "aws_region" "current" {}

resource "aws_fis_experiment_template" "cpu_stress" {
  description = "Stress CPU on EC2 instances tagged with ${var.tag_key}=${var.tag_value}"
  role_arn    = var.fis_role_arn

  stop_condition {
    source = "none"
  }

  target {
    name           = "target-instances"
    resource_type  = "aws:ec2:instance"
    selection_mode = var.selection_mode

    resource_tag {
      key   = var.tag_key
      value = var.tag_value
    }
  }

  action {
    name      = "stress-cpu"
    action_id = "aws:ssm:send-command"

    target {
      key   = "Instances"
      value = "target-instances"
    }

    parameter {
      key   = "documentArn"
      value = format("arn:aws:ssm:%s::document/%s", data.aws_region.current.name, var.ssm_document)
    }

    parameter {
      key   = "documentParameters"
      value = jsonencode({
        commands = [var.stress_command]
      })
    }

    parameter {
      key   = "duration"
      value = var.duration
    }
  }

  dynamic "experiment_report_configuration" {
    for_each = var.enable_experiment_report ? [1] : []
    content {
      outputs {
        s3_configuration {
          bucket_name = var.report_s3_bucket_name
          prefix      = "fis-terminate-instances-50"
        }
      }
    }
  }
}
