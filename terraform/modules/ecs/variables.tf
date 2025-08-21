variable "private_subnet_ids" {
  type = list(string)
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "ecs_task_execution_role_arn" {
  type = string
}

variable "ecs_sg_id" {
  type = string
}

variable "alb_target_group_arn" {
  type = string
}

variable "app_image" {
  type = string
}

variable "app_port" {
  type = number
  default = 3000
}

# Toggle: true = private mode (prod), false = public mode (debug)
variable "use_private_subnets" {
  type    = bool
  default = true
}