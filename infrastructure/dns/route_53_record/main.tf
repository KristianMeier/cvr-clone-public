resource "aws_route53_record" "kkm_root_A_record" {
  zone_id = var.kkm_zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.alb_alias_name
    zone_id                = var.alb_alias_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "kkm_www_A_record" {
  zone_id = var.kkm_zone_id
  name    = "www.${var.domain_name}"
  type    = "A"

  alias {
    name                   = var.alb_alias_name
    zone_id                = var.alb_alias_zone_id
    evaluate_target_health = true
  }
}

# TODO: Refactor this to a for_each loop
resource "aws_route53_record" "cert_validation_1" {
  zone_id = var.kkm_zone_id
  name    = tolist(var.cert_dvo)[0].resource_record_name
  type    = tolist(var.cert_dvo)[0].resource_record_type
  records = [tolist(var.cert_dvo)[0].resource_record_value]
  ttl     = 60
}

# TODO: Refactor this to a for_each loop
resource "aws_route53_record" "cert_validation_2" {
  zone_id = var.kkm_zone_id
  name    = tolist(var.cert_dvo)[1].resource_record_name
  type    = tolist(var.cert_dvo)[1].resource_record_type
  records = [tolist(var.cert_dvo)[1].resource_record_value]
  ttl     = 60
}