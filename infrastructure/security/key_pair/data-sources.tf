data "aws_ssm_parameter" "public_key" {
  name = "public_key_content"
}

