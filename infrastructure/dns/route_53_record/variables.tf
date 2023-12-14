variable "alb_alias_name" {
  description = "The name of the alias"
  type        = string
}

variable "alb_alias_zone_id" {
  description = "The name of the zone"
  type        = string
}

variable "kkm_zone_id" {
  description = "The name of the zone"
  type        = string
}

variable "cert_dvo" {
  description = "The name of the dvo"
  type        = any
}

variable "domain_name" {
  description = "The name of the domain"
  type        = string
}