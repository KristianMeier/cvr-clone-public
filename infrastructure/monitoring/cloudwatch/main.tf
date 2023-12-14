resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = var.asg_high_cpu_alarm_name
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "70"
  alarm_description   = "This metric triggers when CPU usage is above 70% for 10 minutes"

  dimensions = {
    AutoScalingGroupName = var.asg_name
  }

  alarm_actions             = [var.sns_topic_alarm_arn, var.asg_scale_up_policy_arn]
  ok_actions                = [var.sns_cpu_ok_arn]
  insufficient_data_actions = [var.sns_insufficient_data_arn]
}
resource "aws_cloudwatch_metric_alarm" "cpu_low" {
  alarm_name          = var.asg_low_cpu_alarm_name
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "40"
  alarm_description   = "This metric triggers when CPU usage is below 40% for 10 minutes"

  dimensions = {
    AutoScalingGroupName = var.asg_name
  }

  alarm_actions = [var.asg_scale_down_policy_arn]
}
