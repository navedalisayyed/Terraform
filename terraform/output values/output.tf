# Attribute Reference: EC2 Instance public ip

output "ec2_Instance_PublicIP" {
    description = "ec2 Public IP"
    value = aws_instance.my_instance.public_ip
}

# Arguement Reference: EC2 Instance private IP

output "ec2_Instance_PrivateIP" {
    description = "ec2 instance private ip"
    value = aws_instance.my_instance.private_ip
  
}

# Arguement Reference: Secuirity group associated with EC2 instance

output "ec2_SG" {
    description = "ec2 SG"
    value = aws_instance.my_instance.security_groups
  
}

# Attribute Reference:  Create Public DNS URL with https://

output "ec2_Public_DNS" {
    description = "Public DNS URL"
    value = "http://${ aws_instance.my_instance.public_dns }"
  
}