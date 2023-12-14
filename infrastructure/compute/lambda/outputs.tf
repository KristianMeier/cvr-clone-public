output "lambda_arn" {
  description = "The lambda arn"
  value       = aws_lambda_function.cvr_dk.arn
}

output "lambda_invoke_arn" {
  description = "The lambda invoke arn"
  value       = aws_lambda_function.cvr_dk.invoke_arn
}