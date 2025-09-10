output "public_ip_address" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.example.public_ip
  
}
output "Instance_region" {
  description = "The region where the instance is deployed"
  value       = aws_instance.example.availability_zone
  
}