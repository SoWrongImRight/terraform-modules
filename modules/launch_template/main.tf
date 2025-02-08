resource "aws_launch_template" "this" {
  name_prefix = var.name_prefix
  image_id = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name

  vpc_security_group_ids = var.security_group_ids
  user_data = base64encode(var.user_date)

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
        volume_size = var.volume_size
        volume_type = "gp3"
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags = var.tags
  }
}