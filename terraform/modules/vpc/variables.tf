variable "vpc_cidr" {
  description = "CIDR block for VPC"
  default     = "192.168.0.0/16"
}

variable "app_port" {
  description = "Port the app listens on"
  default     = 3000
}

variable "aws_region" {
  description = "AWS region"
  default     = "ap-south-1"
}