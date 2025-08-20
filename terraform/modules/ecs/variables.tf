variable "app_image" {
  description = "Docker image URI from ECR"
}

variable "app_port" {
  description = "Port the app listens on"
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "ecs_sg_id" {
  description = "Security group ID for ECS"
}

variable "alb_target_group_arn" {
  description = "ARN of the ALB target group"
}

variable "ecs_task_execution_role_arn" {
  description = "ARN of the ECS task execution role"
}
