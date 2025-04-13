variable "prefix_name" {
  description = "Prefix to use for unique bucket name generation"
  type = string
}

variable "tags" {
    description = "Tags to apply to the bucket"
    type = map(string)
    default = {}
}

variable "versioning" {
  description = "Enable versioning"
  type = bool
  default = false
}

variable "force_destroy" {
  description = "Delete objects in the bucket when the bucket is destroyed"
  type = bool
  default = false
}

variable "enable_encryption" {
  description = "Enable KMS encryption for this bucket"
  type = bool
  default = true
}

variable "kms_key_id" {
  description = "KMS ID to use for bucket encryption"
  type = string
  default = null
}