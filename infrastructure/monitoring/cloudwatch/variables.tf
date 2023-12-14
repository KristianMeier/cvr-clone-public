variable "sns_topic_alarm_arn" {
  description = "value of the sns topic alarm arn"
  type        = string
}

variable "sns_cpu_ok_arn" {
  description = "value of the sns topic ok arn"
  type        = string
}

variable "sns_insufficient_data_arn" {
  description = "value of the sns topic insufficient data arn"
  type        = string
}

variable "asg_name" {
  description = "value of the asg name"
  type        = string
}

variable "asg_scale_up_policy_arn" {
  description = "value of the asg scale up policy arn"
  type        = string
}

variable "asg_scale_down_policy_arn" {
  description = "value of the asg scale down policy arn"
  type        = string
}

variable "asg_high_cpu_alarm_name" {
  description = "value of the asg high cpu"
  type        = string
}

variable "asg_low_cpu_alarm_name" {
  description = "value of the asg low cpu"
  type        = string
}


