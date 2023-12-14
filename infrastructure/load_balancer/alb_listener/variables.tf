# Copilot create variables, as string, for the following: alb_arn target_group_backend_arn target_group_frontend_arn cert_validation_arn

variable "alb_arn" {
  description = "value of the alb arn"
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

variable "cert_validation_arn" {
  description = "value of the cert validation arn"
  type        = string
}

variable "http_redicrect_listener_name" {
  description = "value of the http redirect listener name"
  type        = string
}

variable "backend_listerner_4000_name" {
  description = "value of the backend listener 4000 name"
  type        = string
}

variable "https_listener_443_name" {
  description = "value of the https listener 443 name"
  type        = string
}