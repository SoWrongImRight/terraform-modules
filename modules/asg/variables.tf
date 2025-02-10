variable "launch_template_id" {
  description = "Launch Template ID for ASG"
  type = string
}

variable "launch_template_version" {
  description = "Version of Launch Template to use"
  type = string
  default = "$Latest"
}

variable "subnet_ids" {
  description = "List of subnets ID's where ASG instances should be created"
  type = list(string)
}

variable "desired_capacity" {
  description = "Desired number of instances in ASG"
  type = number
  default = 1
}

variable "min_size" {
  description = "Minimum number of instances in ASG"
  type = number
  default = 1
}

variable "max_size" {
  description = "Maximum number of instance in ASG"
  type = number
  default = 5
}

variable "force_delete" {
  description = "Whether to allow force deletion of ASG"
  type = bool
  default = false
}

variable "tags" {
  description = "Tags to apply to ASG"
  type = map(string)
  default = {}
}

variable "target_group_arns" {
  description = "ARN of target group"
  type = list(string)
}