resource "aws_instance" "my_instance" {
  ami                    = "ami-0da59f1af71ea4ad2"
  instance_type          = "t2.nano"
  key_name               = "Bootstrapkey"
  subnet_id              = aws_subnet.vpc-dev-pub-subnet.id
  vpc_security_group_ids = [aws_security_group.dev-vpc-SG.id]
  user_data              = file("sample-script.sh")
}