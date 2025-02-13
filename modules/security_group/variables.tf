variable "sg_name" {
  description = "Security Group name"
  type        = string
}

variable "sg_description" {
  description = "Security Group description"
  type        = string
  default     = "Managed by Terraform"
}

variable "vpc_id" {
  description = "VPC ID for the Security Group"
  type        = string
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    from_port      = number
    to_port        = number
    protocol       = string
    cidr_blocks    = optional(list(string))
    prefix_list_ids = optional(list(string))
  }))
  default = []
}

variable "egress_rules" {
  description = "List of egress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = optional(list(string))
  }))
  default = []
}

variable "tags" {
  description = "Tags for Security Group"
  type        = map(string)
  default     = {}
}
