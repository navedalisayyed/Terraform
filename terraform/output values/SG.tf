# Create SSH SG

resource "aws_security_group" "SSH-SG" {
    name = "SSH-SG"
    description = "Dev-SG"
    ingress  {
        description = "Allow port 22"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        
    }
    egress  {
        description = "Allow all ports"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

      
}

