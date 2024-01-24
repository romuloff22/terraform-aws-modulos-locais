output "vm_ip" {
  description = "IP publico da VM"
  value       = aws_instance.vm.public_ip

}