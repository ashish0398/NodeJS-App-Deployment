output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public[*].id
}

output "alb_sg_id" {
  description = "Security group ID for the ALB"
  value       = aws_security_group.alb.id
}

output "ecs_sg_id" {
  description = "Security group ID for ECS"
  value       = aws_security_group.ecs_tasks.id
}

output "private_subnet_ids" {
  value = aws_subnet.private.id
}

output "ecs_tasks_security_group_id" {
  value = aws_security_group.ecs_tasks.id
}