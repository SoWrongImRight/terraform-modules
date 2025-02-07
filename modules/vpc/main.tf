resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "${var.vpc_name}-${var.environment}"
    Environment = var.environment
  }
}

resource "aws_subnet" "public" {
    count = length(var.public_subnets)

    vpc_id = aws_vpc.main.id
    cidr_block = var.public_subnets[count.index]
    map_public_ip_on_launch = true
    availability_zone = element(var.availability_zones, count.index)

    tags = {
        Name = "public-subnet-${count.index + 1}"
        Environment = var.environment
    }
}

resource "aws_subnet" "private" {
    count = length(var.private_subnets)

    vpc_id = aws_vpc.main.id
    cidr_block = var.private_subnets[count.index]
    availability_zone = element(var.availability_zones, count.index)

    tags = {
        Name = "private-subnet-${count.index + 1}"
        Environment = var.environment
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id 

    tags = {
      Name = "${var.vpc_name}-igw"
      Environment = var.environment
    }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table1"
    Environment = var.environment
  }
}

resource "aws_route_table_association" "public" {
  count = length(var.public_subnets)
  subnet_id = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}