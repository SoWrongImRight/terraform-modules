variable "lb_name" {
  description = "Name of load balancer"
  type = string
  default = "ALB"
}

variable "environment" {
  type = string
}

variable "internal" {
  description = "Sets load balancer as internal if true"
  type = bool
  default = false
}

variable "lb_type" {
  description = "Sets load balancer to network or application"
  type = string
  default = "appication"
}

variable "security_group_ids" {
  description = "A list of security group ID's"
  type = list(string)
}

variable "subnet_ids" {
  description = "List of subnets ID for load balancer"
  type = list(string)
}

variable "tags" {
  description = "Tags to apply to load balancer"
  type = map(string)
  default = {}
}

variable "target_group_name" {
  description = "Name of target group for load balancer"
  type = string
}

variable "target_group_port" {
  description = "Port for load balancer target group"
  type = number
  default = 80
}

variable "target_group_protocol" {
  description = "Protocol for load balancer target group"
  type = string
  default = "HTTP"
}

variable "vpc_id" {
  description = "ID of the vpc for target group"

}

variable "health_check_path" {
  description = "Path for health check"
  type = string
  default = "/"
}