output "instance_public_ip" {
  description = "The public IP address of the instance"
  value       = aws_instance.nginx-server.public_ip
}
output "instance_url" {
  description = "The url to access the nginx server"
  value       = "http://${aws_instance.nginx-server.public_ip}"
}
