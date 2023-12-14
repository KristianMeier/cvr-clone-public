output "cloudfront_distribution_domain_name" {
  value = module.cloudfront_bucket.cloudfront_domain_name
}

output "api_url" {
  value = "${module.api_gateway.api_gateway_url}/"
}

output "eip_public_ip" {
  value = module.ec2.eip_public_ip
}