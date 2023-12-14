data "aws_iam_policy_document" "assume_role_policy_doc" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "dynamodb_policy_doc" {
  statement {
    actions = [
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:UpdateItem",
      "dynamodb:Scan",
      "dynamodb:Query",
      "dynamodb:DeleteItem",
    ]
    effect    = "Allow"
    resources = ["arn:aws:dynamodb:*:*:table/${aws_dynamodb_table.my_table.name}"]
  }
}