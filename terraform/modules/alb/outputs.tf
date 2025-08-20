output "target_group_arn" {
  description = "ARN of the ALB target group"
  value       = aws_alb_target_group.app.arn
}

output "alb_dns_name" {
  description = "DNS name of the ALB"
  value       = aws_alb.main.dns_name
}