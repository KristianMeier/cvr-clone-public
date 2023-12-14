output "key_pair_name" {
  value       = aws_key_pair.key_pair.key_name
  description = "value of the key pair name"
}