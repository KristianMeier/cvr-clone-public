resource "aws_dynamodb_table" "my_table" {
  name           = var.dynamodb_table_name
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }
}


resource "aws_iam_role" "ec2_dynamodb_role" {
  name               = var.ec2_dynamodb_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy_doc.json
}

resource "aws_iam_policy" "dynamodb_policy" {
  name   = var.dynamodb_policy_name
  policy = data.aws_iam_policy_document.dynamodb_policy_doc.json
}

resource "aws_iam_role_policy_attachment" "dynamodb_attachment" {
  role       = aws_iam_role.ec2_dynamodb_role.name
  policy_arn = aws_iam_policy.dynamodb_policy.arn
}

resource "aws_iam_instance_profile" "ec2_dynamodb_profile" {
  name = var.ec2_dynamodb_profile_name
  role = aws_iam_role.ec2_dynamodb_role.name
}
