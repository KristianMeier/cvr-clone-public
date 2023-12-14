output "dynamodb_iam_instance_profile_name" {
  value       = aws_iam_instance_profile.ec2_dynamodb_profile.name
  description = "value of the dynamodb iam instance profile name"
}