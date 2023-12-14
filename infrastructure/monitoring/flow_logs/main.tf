resource "aws_iam_role" "vpc_flow_logs_role" {
  name               = var.vpc_flow_logs_role_name
  assume_role_policy = data.aws_iam_policy_document.vpc_flow_logs_service_assume_role_policy_doc.json
}

resource "aws_iam_policy" "vpc_flow_logs_policy" {
  name   = var.vpc_flow_logs_policy_name
  policy = data.aws_iam_policy_document.vpc_flow_logs_s3_access_policy_doc.json
}

resource "aws_iam_role_policy_attachment" "vpc_flow_logs_policy_attach" {
  role       = aws_iam_role.vpc_flow_logs_role.name
  policy_arn = aws_iam_policy.vpc_flow_logs_policy.arn
}

resource "aws_flow_log" "vpc_all_traffic_flow_log" {
  log_destination      = var.s3_bucket_arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = var.vpc_id

  depends_on = [aws_iam_role_policy_attachment.vpc_flow_logs_policy_attach]

  tags = {
    Name = var.vpc_flow_logs_name
  }
}
