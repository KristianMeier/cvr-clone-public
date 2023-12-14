resource "aws_lb" "alb" {
  name                       = var.alb_name
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [var.security_group_id]
  enable_deletion_protection = false
  subnets                    = [var.public_subnet_1_id, var.public_subnet_2_id]
  enable_http2               = true
}