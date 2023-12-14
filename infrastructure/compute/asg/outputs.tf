output "asg_name" {
  value       = aws_autoscaling_group.asg.name
  description = "value of the autoscaling group name"
}

output "asg_arn" {
  value       = aws_autoscaling_group.asg.arn
  description = "value of the autoscaling group arn"
}

output "asg_scale_up_policy_arn" {
  value       = aws_autoscaling_policy.scale_up.arn
  description = "value of the autoscaling group scale up policy arn"
}

output "asg_scale_down_policy_arn" {
  value       = aws_autoscaling_policy.scale_down.arn
  description = "value of the autoscaling group scale down policy arn"
}