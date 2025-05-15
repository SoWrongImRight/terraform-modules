resource "aws_iam_role" "fis" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "fis.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

data "aws_iam_policy_document" "fis_permissions" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:DescribeInstances", "ec2:TerminateInstances"]
    resources = ["*"]
  }

  dynamic "statement" {
    for_each = var.include_ssm_permissions ? [1] : []
    content {
      effect = "Allow"
      actions = [
        "ssm:SendCommand",
        "ssm:DescribeInstanceInformation",
        "ssm:GetCommandInvocation"
      ]
      resources = ["*"]
    }
  }

  dynamic "statement" {
    for_each = var.s3_bucket_arn != null ? [1] : []
    content {
      effect = "Allow"
      actions = ["s3:PutObject"]
      resources = ["${var.s3_bucket_arn}/*"]
    }
  }
}

resource "aws_iam_policy" "fis_policy" {
  name   = "${var.role_name}-policy"
  policy = data.aws_iam_policy_document.fis_permissions.json
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.fis.name
  policy_arn = aws_iam_policy.fis_policy.arn
}
