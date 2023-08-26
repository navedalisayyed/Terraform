# create custom VPC
resource "aws_vpc" "vpc-dev" {
  cidr_block = "10.0.0.0/16"

}
# Create public  subnet

resource "aws_subnet" "vpc-dev-pub-subnet" {
  vpc_id                  = aws_vpc.vpc-dev.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true
}

# Create the internet gateway

resource "aws_internet_gateway" "dev-vpc-igw" {
  vpc_id = aws_vpc.vpc-dev.id
}

# Create the route table

resource "aws_route_table" "dev-vpc-route-table" {
  vpc_id = aws_vpc.vpc-dev.id
}

# Create the routes for internet access

resource "aws_route" "vpc-dev-public-route" {
  route_table_id         = aws_route_table.dev-vpc-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.dev-vpc-igw.id

}

# Associate the route tabel with subnet

resource "aws_route_table_association" "dev-vpc-route-table-association" {
  route_table_id = aws_route_table.dev-vpc-route-table.id
  subnet_id      = aws_subnet.vpc-dev-pub-subnet.id

}

# Create SG 

resource "aws_security_group" "dev-vpc-SG" {
  name        = "dev-vpc-SG"
  description = "dev-vpc-SG"
  vpc_id      = aws_vpc.vpc-dev.id


  ingress {
    description = "Allow port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


}

