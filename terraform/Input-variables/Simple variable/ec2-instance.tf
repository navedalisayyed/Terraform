resource "aws_instance" "my_instance" {
  ami                    = var.ami
  instance_type          = "t2.nano"
  key_name               = "Bootstrapkey"
  count = var.ec2_instance_count
  vpc_security_group_ids =   [ aws_security_group.SSH-SG.id, ]
}