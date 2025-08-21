variable "vpc_cidr" {
  description = "CIDR block for VPC"
  default     = "172.16.0.0/12"
}

variable "app_port" {
  description = "Port the app listens on"
  default     = 3000
}

variable "aws_region" {
  description = "AWS region"
  default     = "ap-south-1"
}