# VPC
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.env_name}-vpc"
  }
}

# Public Subnets
resource "aws_subnet" "public" {
  count             = length(var.public_subnets)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.public_subnets[count.index]
  
  tags = {
    Name = "${var.env_name}-public-subnet-${count.index}"
  }
}

# Private Subnets
resource "aws_subnet" "private" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnets[count.index]
  
  tags = {
    Name = "${var.env_name}-private-subnet-${count.index}"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  
  tags = { 
    Name = "${var.env_name}-igw" 
  }
}

# Elastic IP addresses attached to NAT gateways
resource "aws_eip" "nat" {
  count  = var.number_of_nat
  domain = "vpc"
  
  tags = { 
    Name = "${var.env_name}-nat-eip-${count.index}" 
  }
}

# NAT Gateway to be deployed
resource "aws_nat_gateway" "this" {
  count         = var.number_of_nat
  subnet_id     = aws_subnet.public[count.index].id
  allocation_id = aws_eip.nat[count.index].id
  
  tags = { 
    Name = "${var.env_name}-nat-gw-${count.index}" 
  }
}

# Route table for public subnet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id 

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = merge(
    { Name = "${var.env_name}-public-rt" },
    var.tags
  )
}

# Route table association (public)
resource "aws_route_table_association" "public" {
  count          = length(var.public_subnets)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# Route Tables for Private Subnets
# Dynamically sized based on your number of NATs (1:1 mapping)
resource "aws_route_table" "private" {
  count  = var.number_of_nat
  vpc_id = aws_vpc.this.id
  
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this[count.index].id
  }

  tags = merge(
    { Name = "${var.env_name}-private-rt-${count.index}" },
    var.tags
  )
}

# Route table association (private)
# This distributes the 3 private subnets across your NAT gateways
resource "aws_route_table_association" "private" {
  count          = length(var.private_subnets)
  subnet_id      = aws_subnet.private[count.index].id
  # Uses the modulo operator (%) to distribute subnets if you have fewer NATs than subnets
  route_table_id = aws_route_table.private[count.index % var.number_of_nat].id
}