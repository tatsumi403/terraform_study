# VPC
resource "aws_vpc" "my_first_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name        = "My First VPC"
    Environment = var.environment
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_first_vpc.id

  tags = {
    Name        = "My Internet Gateway"
    Environment = var.environment
  }
}

resource "aws_default_route_table" "route_table" {
  default_route_table_id = aws_vpc.my_first_vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name        = "My Route Table"
    Environment = var.environment
  }
}

# サブネット
resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.my_first_vpc.id
  cidr_block              = var.subnet_cidr_block
  map_public_ip_on_launch = true
  availability_zone       = "ap-northeast-1a"
  tags = {
    Name        = "My Public subnet"
    Environment = var.environment
  }
}
