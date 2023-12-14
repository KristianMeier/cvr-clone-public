output "alb_arn" {
  description = "The application load balancer ARN"
  value       = aws_lb.alb.arn
}

output "alb_alias_name" {
  description = "The name of the alias"
  value       = aws_lb.alb.dns_name
}

output "alb_alias_zone_id" {
  description = "The name of the zone"
  value       = aws_lb.alb.zone_id
}