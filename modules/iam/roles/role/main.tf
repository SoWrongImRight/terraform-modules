resource "aws_iam_role" "this" {
  name = var.role_name

  assume_role_policy = var.assume_role_policy_json

  tags = var.tags
}

resource "aws_iam_instance_profile" "this" {
  count = var.create_instance_profile ? 1 : 0
  name  = "${var.role_name}-instance-profile"
  role  = aws_iam_role.this.name
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each = toset(var.policy_arns)

  role       = aws_iam_role.this.name
  policy_arn = each.value
}