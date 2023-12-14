resource "aws_lb_listener" "http_to_https_redirect" {
  load_balancer_arn = var.alb_arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

  tags = {
    Name = var.http_redicrect_listener_name
  }
}

resource "aws_lb_listener" "backend_listener_4000" {
  load_balancer_arn = var.alb_arn
  port              = "4000"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.cert_validation_arn

  default_action {
    type             = "forward"
    target_group_arn = var.target_group_backend_arn
  }

  tags = {
    Name = var.backend_listerner_4000_name
  }
}

resource "aws_lb_listener" "https_listener_443" {
  load_balancer_arn = var.alb_arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.cert_validation_arn

  default_action {
    type             = "forward"
    target_group_arn = var.target_group_frontend_arn
  }

  tags = {
    Name = var.https_listener_443_name
  }
}