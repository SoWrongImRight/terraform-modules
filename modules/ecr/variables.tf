variable "name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "image_tag_mutability" {
  description = "The tag mutability setting for the repository"
  type        = string
  default     = "MUTABLE"
}

variable "scan_on_push" {
  description = "Indicates whether images are scanned on push"
  type        = bool
  default     = true
}

variable "enable_lifecycle_policy" {
  description = "Whether to enable lifecycle policy"
  type        = bool
  default     = false
}

variable "lifecycle_policy" {
  description = "JSON formatted lifecycle policy document"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to apply to the repository"
  type        = map(string)
  default     = {}
}
