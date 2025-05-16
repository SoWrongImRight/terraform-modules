variable "fis_role_arn" {
  description = "The IAM role ARN that FIS assumes"
  type        = string
}

variable "ssm_document" {
  description = "The SSM document to run"
  type        = string
  default     = "AWS-RunShellScript"
}

variable "tag_key" {
  description = "Tag key used to select EC2 targets"
  type        = string
  default     = "Experiment"
}

variable "tag_value" {
  description = "Tag value used to select EC2 targets"
  type        = string
  default     = "ready"
}

variable "stress_command" {
  description = "Shell command to stress the CPU"
  type        = string
  default     = "if command -v apt >/dev/null; then sudo apt-get update && sudo apt-get install -y stress; elif command -v yum >/dev/null; then sudo yum install -y stress; else echo 'unsupported OS'; fi; stress --cpu 2 --timeout 120"
}

variable "duration" {
  description = "Duration of the experiment"
  type        = string
  default     = "PT2M"
}

variable "selection_mode" {
  description = "How many instances to select (e.g. PERCENT(50), COUNT(1))"
  type        = string
  default     = "PERCENT(50)"
}


variable "enable_experiment_report" {
  description = "Enable experiment report configuratiohn"
  type = bool
  default = false
}

variable "report_s3_bucket_name" {
  description = "S3 bucket name for FIS reports"
  type = string
  default = null
}