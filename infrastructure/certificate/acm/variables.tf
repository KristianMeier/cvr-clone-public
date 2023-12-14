variable "cert_validation_1_fdqn" {
  description = "The name of the cert validation 1 record"
  type        = string
}

variable "cert_validation_2_fdqn" {
  description = "The name of the cert validation 2 record"
  type        = string
}

variable "kkm_zone_id" {
  description = "The name of the zone"
  type        = string
}

variable "domain_name" {
  description = "The name of the domain"
  type        = string
}

variable "acm_certificate_name" {
  type        = string
  description = "value of the acm certificate name"
}