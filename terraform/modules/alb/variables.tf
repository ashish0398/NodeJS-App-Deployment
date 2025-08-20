variable "alb_sg_id" {
  description = "Security group ID for ALB"
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "app_port" {
  description = "Port the app listens on"
}
