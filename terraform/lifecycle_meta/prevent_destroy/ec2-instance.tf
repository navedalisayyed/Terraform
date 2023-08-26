resource "aws_instance" "my_instance" {
  ami                    = "ami-0da59f1af71ea4ad2"
  instance_type          = "t2.nano"
  tags = {
    name = "web-1"
  }

  lifecycle {
    
    prevent_destroy = false
  }
  
}

