resource "aws_launch_template" "lt" {
  image_id               = "ami-0b04706355ee837b1" # Linux 2 AMI
  instance_type          = "t3.micro"
  key_name               = var.key_pair_name
  vpc_security_group_ids = [var.security_group_id]
  user_data              = base64encode(local.user_data_app)

  placement {
    group_name = var.placement_group_name
  }

  iam_instance_profile {
    name = var.iam_instance_profile_name
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = var.launch_template_name
    }
  }
}