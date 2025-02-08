variable "sg_name" {
  description = "Name of SG"
  type = string
}

variable "sg_description" {
  description = "Description of SG"
  type = string
  default = "Managed by Terraform"
}

variable "vpc_id" {
  description = "VPC ID where SG will be created"
  type = string
}

variable "tags" {
  description = "Tags for SG"
  type = map(string)
  default = {}
}

variable "my_ip" {
  description = "My IP address for ssh connection"
  type = string
}