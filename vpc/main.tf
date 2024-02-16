resource "aws_vpc" "dev_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "dev_vpc"

  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = var.public_Snet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.dev_vpc.id
  cidr_block        = var.private_Snet_cidr
  availability_zone = var.availability_zone

  tags = {
    Name = "private-subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.dev_vpc.id

  tags = {
    Name = "main-gateway"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.dev_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# Añadir recursos adicionales para la subred privada como NAT Gateway o Private Route Table si es necesario.