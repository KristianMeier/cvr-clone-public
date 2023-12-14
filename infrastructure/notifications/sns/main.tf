resource "aws_sns_topic" "cpu_alarm_topic" {
  name         = var.cpu_alarm_topic_name
  display_name = "CPU Alarm Topic"
}

resource "aws_sns_topic_subscription" "cpu_alarm_email_subscription" {
  topic_arn = aws_sns_topic.cpu_alarm_topic.arn
  protocol  = "email"
  endpoint  = data.aws_ssm_parameter.notification_email.value
}

resource "aws_sns_topic" "cpu_ok_topic" {
  name = var.cpu_ok_topic_name
}

resource "aws_sns_topic_subscription" "cpu_ok_email_subscription" {
  topic_arn = aws_sns_topic.cpu_ok_topic.arn
  protocol  = "email"
  endpoint  = data.aws_ssm_parameter.notification_email.value
}

resource "aws_sns_topic" "cpu_insufficient_data_topic" {
  name = var.cpu_insufficient_data_topic_name
}

resource "aws_sns_topic_subscription" "cpu_insufficient_data_email_subscription" {
  topic_arn = aws_sns_topic.cpu_insufficient_data_topic.arn
  protocol  = "email"
  endpoint  = data.aws_ssm_parameter.notification_email.value
}