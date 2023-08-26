resource "aws_instance" "my_instance" {
  ami                    = var.ami
  instance_type          = var.ec2_instance.type["Big-app"]
  key_name               = "Bootstrapkey"
  count = var.ec2_instance_count
  vpc_security_group_ids =   [ aws_security_group.SSH-SG.id, ]
  tags = var.ec2_instance_tags
}