provider "aws" {
  region=var.region
  
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  
  tags={
    Name="Bali_vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  
  vpc_id = aws_vpc.main.id
  cidr_block = var.subnet_public_cidrs
  

  tags={
    Name="Public Subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  
  vpc_id = aws_vpc.main.id
  cidr_block = var.subnet_private_cidrs
  
  tags={
    Name="Private Subnet"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags={
    Name="my_vpc_IG"
  }
  
}

resource "aws_route_table" "second_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "Public Route Table"
  }
  
}

resource "aws_route_table_association" "public_subnets_asso" {
  
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.second_rt.id
  
}

resource "aws_security_group" "http_access" {
  vpc_id = aws_vpc.main.id
  name   = "http_access"
  description = "SG module "

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Http Acess"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
