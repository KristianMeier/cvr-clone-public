resource "aws_instance" "dev_instance" {
  subnet_id              = var.public_subnet_1_id
  vpc_security_group_ids = [var.security_group_id]

  launch_template {
    id = var.launch_template_id
  }

  tags = {
    Name = var.instance_name
  }
}

resource "aws_eip" "eip" {
  instance = aws_instance.dev_instance.id

  tags = {
    Name = var.instance_eip_name
  }
}