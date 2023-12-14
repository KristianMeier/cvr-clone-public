resource "aws_lb_target_group" "frontend" {
  name     = var.frontend_target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group" "backend" {
  name     = var.backend_target_group_name
  port     = 4000
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}