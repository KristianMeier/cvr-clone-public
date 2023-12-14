variable "api_gateway_execution_arn" {
  description = "The execution ARN of the API Gateway"
  type        = string
  default     = ""
}

variable "lambda_role" {
  description = "The role of the lambda"
  type        = string
}

variable "lambda_function_name" {
  description = "The name of the lambda function"
  type        = string
}