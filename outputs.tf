output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = aws_subnet.private.id
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.main.id
}

output "allow_ssh_sg_id" {
  description = "The ID of the allow SSH security group"
  value       = aws_security_group.allow_ssh.id
}

output "allow_http_sg_id" {
  description = "The ID of the allow HTTP security group"
  value       = aws_security_group.allow_http.id
}
