output "cert_dvo" {
  value = aws_acm_certificate.cert.domain_validation_options
}

output "cert_validation_arn" {
  value = aws_acm_certificate_validation.cert_validation.certificate_arn
}