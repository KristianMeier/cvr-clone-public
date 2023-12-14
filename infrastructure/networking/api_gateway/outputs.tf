output "api_gateway_execution_arn" {
  description = "The execution ARN of the API Gateway"
  value       = aws_api_gateway_deployment.deployment.execution_arn
}

output "api_gateway_url" {
  description = "The URL of the API Gateway"
  value       = aws_api_gateway_deployment.deployment.invoke_url
}