output "eip_public_ip" {
  description = "The public IP address of the EIP"
  value       = aws_eip.eip.public_ip
}