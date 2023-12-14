output "public_subnet_1_id" {
  description = "Public subnet id"
  value       = aws_subnet.public_subnet_1.id
}

output "public_subnet_2_id" {
  description = "Public subnet 2 id"
  value       = aws_subnet.public_subnet_2.id
}
