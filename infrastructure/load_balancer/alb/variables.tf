variable "security_group_id" {
  description = "The security group id to use for the EC2 instances"
  type        = string
}

variable "public_subnet_1_id" {
  description = "value of the public subnet id"
  type        = string
}

variable "public_subnet_2_id" {
  description = "value of the public subnet 2 id"
  type        = string
}

variable "alb_name" {
  description = "The name of the alb"
  type        = string
}