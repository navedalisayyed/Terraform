resource "aws_eip" "my-eip" {
  instance   = aws_instance.my_instance.id
  domain     = "vpc"
  depends_on = [aws_internet_gateway.dev-vpc-igw]
}