resource "aws_instance" "my_instance" {
  ami                    = "ami-0da59f1af71ea4ad2"
  instance_type          = "t2.nano"
  #availability_zone = "ap-south-1a"
  availability_zone = "ap-south-1b"

  lifecycle {
    
    create_before_destroy = true
  }
  
}

