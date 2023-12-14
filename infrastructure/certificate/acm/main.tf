resource "aws_acm_certificate" "cert" {
  domain_name               = var.domain_name
  validation_method         = "DNS"
  subject_alternative_names = ["www.${var.domain_name}"]

  tags = {
    Name = var.acm_certificate_name
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "cert_validation" {
  certificate_arn = aws_acm_certificate.cert.arn
  validation_record_fqdns = [
    var.cert_validation_1_fdqn,
    var.cert_validation_2_fdqn,
  ]
  depends_on = [
    var.cert_validation_1_fdqn,
    var.cert_validation_2_fdqn,
  ]
}