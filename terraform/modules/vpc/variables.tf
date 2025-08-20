variable "vpc_cidr" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "app_port" {
  description = "Port the app listens on"
  default     = 3000
}