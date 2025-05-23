variable "name_prefix" {
    description = "Prefix for launch template name"
    type = string
}

variable "ami_id" {
    description = "AMI ID for instances"
    type = string
}

variable "instance_type" {
  description = "Instance type"
  type = string
  default = "t2.micro"
}

variable "key_name" {
  description = "Name of key pair to be used"
  type = string
  default = null
}

variable "security_group_ids" {
  description = "A list of security group ID's"
  type = list(string)
}

variable "user_data" {
  description = "User data script for initialization"
  type = string
  default = ""
}

variable "volume_size" {
  description = "Size of root EBS volume"
  type = number
  default = 20
}

variable "tags" {
  description = "Tags to apply to launch template"
  type = map(string)
  default = {}
}

variable "iam_instance_profile_name" {
  description = "Optional EC2 IAM instance profile name"
  type = string
  default = null
}