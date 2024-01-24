output "subnet_id" {
  description = "ID da subnet"
  value       = aws_subnet.subnet.id

}

output "security_group_id" {
  description = "ID do Security Group"
  value       = aws_security_group.security_group.id

}