variable "dev_resource" {
  description = "Name given to the dev resources"
  type        = string
  default     = "dev-resource"
}

variable "prod_resource" {
  description = "Name given to the shared resources"
  type        = string
  default     = "prod-resource"
}

variable "shared_resource" {
  description = "The name of the prod environment"
  type        = string
  default     = "shared-resource"
}

variable "domain_name" {
  description = "The name of the domain"
  type        = string
  default     = "kkm-terraform.com"
}

