variable "policy_name" {
  type        = string
  description = "Name of the scaling policy"
}

variable "autoscaling_group_name" {
  type        = string
  description = "Name of the ASG to attach this policy to"
}

variable "predefined_metric_type" {
  type        = string
  description = "The metric type to track (e.g., ASGAverageCPUUtilization)"
  default     = "ASGAverageCPUUtilization"
}

variable "target_value" {
  type        = number
  description = "The target value for the metric"
  default     = 60
}