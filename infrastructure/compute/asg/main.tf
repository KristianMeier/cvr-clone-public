resource "aws_autoscaling_policy" "scale_down" {
  name                   = var.scale_up_policy_name
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.asg.name
}

resource "aws_autoscaling_policy" "scale_up" {
  name                   = var.scale_down_policy_name
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.asg.name
}
resource "aws_autoscaling_group" "asg" {
  name                = var.auto_scaling_group_name
  desired_capacity    = 1
  min_size            = 1
  max_size            = 2
  vpc_zone_identifier = [var.public_subnet_1_id, var.public_subnet_2_id]
  target_group_arns   = [var.target_group_backend_arn, var.target_group_frontend_arn]

  health_check_type         = "ELB"
  health_check_grace_period = 300
  force_delete              = true

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }
}



