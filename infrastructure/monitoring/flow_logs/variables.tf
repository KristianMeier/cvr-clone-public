variable "s3_bucket_arn" {
  description = "value of the s3 bucket arn"
  type        = string
}

variable "vpc_id" {
  description = "value of the vpc id"
  type        = string
}

variable "vpc_flow_logs_role_name" {
  description = "value of the vpc flow logs role name"
  type        = string
}

variable "vpc_flow_logs_policy_name" {
  description = "value of the vpc flow logs policy name"
  type        = string
}

variable "vpc_flow_logs_name" {
  description = "value of the vpc flow logs name"
  type        = string
}