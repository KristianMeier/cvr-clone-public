variable "key_pair_name" {
  description = "The name of the key pair to use for the EC2 instances"
  type        = string
}

variable "security_group_id" {
  description = "The security group id to use for the EC2 instances"
  type        = string
}

variable "iam_instance_profile_name" {
  description = "The IAM instance profile name to use for the EC2 instances"
  type        = string
}

variable "cloudfront_domain_name" {
  description = "The domain name of the CloudFront distribution"
  type        = string
}

variable "gateway_api_url" {
  description = "The URL of the API Gateway"
  type        = string
}

variable "placement_group_name" {
  description = "The name of the placement group"
  type        = string
}

variable "launch_template_name" {
  description = "The name of the launch template"
  type        = string
}


