resource "aws_key_pair" "key_pair" {
  key_name   = var.key_pair_name
  public_key = data.aws_ssm_parameter.public_key.value
}