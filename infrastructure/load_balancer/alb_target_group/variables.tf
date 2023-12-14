variable "vpc_id" {
  description = "value of the vpc id"
  type        = string
}

variable "frontend_target_group_name" {
  description = "The name of the frontend target group"
  type        = string
}

variable "backend_target_group_name" {
  description = "The name of the backend target group"
  type        = string
}