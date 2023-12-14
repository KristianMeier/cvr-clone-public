variable "public_subnet_1_id" {
  description = "value of the public subnet id"
  type        = string
}

variable "public_subnet_2_id" {
  description = "value of the public subnet 2 id"
  type        = string
}

variable "target_group_backend_arn" {
  description = "value of the backend target group arn"
  type        = string
}

variable "target_group_frontend_arn" {
  description = "value of the frontend target group arn"
  type        = string
}

variable "launch_template_id" {
  description = "value of the launch template id"
  type        = string
}

variable "scale_up_policy_name" {
  description = "The name of the scale up policy"
  type        = string
}

variable "scale_down_policy_name" {
  description = "The name of the scale down policy"
  type        = string
}

variable "auto_scaling_group_name" {
  description = "The name of the auto scaling group"
  type        = string
}