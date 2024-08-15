provider "aws" {
  region="us-east-1"
  
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  
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
    Name = "2nd Route Table"
  }
  
}

resource "aws_route_table_association" "public_subnets_asso" {
  
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_subnet.id
  
}
