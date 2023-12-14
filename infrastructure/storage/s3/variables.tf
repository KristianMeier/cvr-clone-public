variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "create_cloudfront" {
  description = "Whether to create a CloudFront distribution for the S3 bucket"
  type        = bool
  default     = false
}

variable "s3_access_policy_name" {
  description = "The name of the s3 access policy"
  type        = string
}

variable "s3_origin_id" {
  description = "The name of the s3 origin id"
  type        = string
}

variable "cloudfront_distribution_name" {
  description = "The name of the cloudfront distribution"
  type        = string
}