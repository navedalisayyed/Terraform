resource "aws_instance" "my_instance" {
  ami                    = "ami-0da59f1af71ea4ad2"
  instance_type          = "t2.nano"
  key_name               = "Bootstrapkey"
  count = 2
  tags = {
    Name = "Taint"
 }
}




resource "aws_vpc" "vpc-dev" {
  cidr_block = "10.0.0.0/16"

}