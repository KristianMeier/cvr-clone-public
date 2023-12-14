output "target_group_backend_arn" {
  value       = aws_lb_target_group.backend.arn
  description = "value of the backend target group arn"
}

output "target_group_frontend_arn" {
  value       = aws_lb_target_group.frontend.arn
  description = "value of the frontend target group arn"
}