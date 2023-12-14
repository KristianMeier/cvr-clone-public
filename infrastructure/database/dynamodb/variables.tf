variable "dynamodb_table_name" {
  description = "The name of the dynamodb table"
  type        = string
}

variable "ec2_dynamodb_role_name" {
  description = "The name of the ec2 dynamodb role"
  type        = string
}

variable "dynamodb_policy_name" {
  description = "The name of the dynamodb policy"
  type        = string
}

variable "ec2_dynamodb_profile_name" {
  description = "The name of the ec2 dynamodb profile"
  type        = string
}
