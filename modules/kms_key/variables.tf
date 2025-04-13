variable "description" {
  description = "The description of the KMS key"
  type = string
  default = "KMS key managed by Terraform"
}

variable "enable_key_rotation" {
  description = "Specifies whether key rotation is enabled"
  type = bool
  default = true
}

variable "deletion_window_in_days" {
  description = "The waiting period for key deletion"
  type = number
  default = 30
}

variable "alias" {
  description = "An optional alias to assigne to the key (without the 'alias/' prefix)"
  type = string
  default = null
}

variable "policy" {
  description = "A valid KMS key policy (optional)"
  type = string
  default = null
}


variable "tags" {
  description = "Tags to assign to the key"
  type = map(string)
  default = {}
}