output "s3_bucket_arn" {
  value       = aws_s3_bucket.bucket.arn
  description = "value of the s3 bucket arn"
}

output "cloudfront_domain_name" {
  value = var.create_cloudfront ? aws_cloudfront_distribution.distribution[0].domain_name : ""
}

