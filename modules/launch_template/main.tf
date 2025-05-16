resource "aws_launch_template" "this" {
  name_prefix = var.name_prefix
  image_id = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  
  vpc_security_group_ids = var.security_group_ids
  user_data = base64encode(var.user_data)

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
        volume_size = var.volume_size
        volume_type = "gp3"
    }
  }

  dynamic "iam_instance_profile" {
    for_each = var.iam_instance_profile_name != null ? [1] : []
    content {
      name = var.iam_instance_profile_name
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags = var.tags
  }
}
