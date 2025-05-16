variable "role_name" {
  description = "Name of the IAM role"
  type        = string
}

variable "assume_role_policy_json" {
  description = "JSON policy that grants an entity permission to assume the role"
  type        = string
}

variable "policy_arns" {
  description = "List of IAM policy ARNs to attach to the role"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to assign to the IAM role"
  type        = map(string)
  default     = {}
}

variable "create_instance_profile" {
  description = "Whether to create an instance profile for EC2"
  type        = bool
  default     = false
}