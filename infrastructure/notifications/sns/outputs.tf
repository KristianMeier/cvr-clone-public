output "sns_topic_alarm_arn" {
  value       = aws_sns_topic.cpu_alarm_topic.arn
  description = "value of the sns topic alarm arn"
}

output "sns_cpu_ok_arn" {
  value       = aws_sns_topic.cpu_ok_topic.arn
  description = "value of the sns topic ok arn"
}
output "sns_insufficient_data_arn" {
  value       = aws_sns_topic.cpu_insufficient_data_topic.arn
  description = "value of the sns topic insufficient data arn"
}