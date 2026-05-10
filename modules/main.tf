resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

# 1. The Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true # This makes it "Public"

  tags = {
    Name = "${var.vpc_name}-public-subnet"
  }
}

# 2. The Route Table (The Map)
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0" # Send all traffic...
    gateway_id = aws_internet_gateway.igw.id # ...to the Internet
  }

  tags = {
    Name = "${var.vpc_name}-public-rt"
  }
}

# 3. The Association (Connecting the Map to the Subnet)
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
