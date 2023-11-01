resource "aws_vpc" "terra_vpc" {
  cidr_block = var.cidr_network
  tags = {
    Name      = "terra_vpc_bo_06"
    createdBy = "terraform"
  }
}

resource "aws_subnet" "terra_private_subnet" {
  count = var.az_count
  vpc_id     = aws_vpc.terra_vpc.id
  cidr_block = var.private_subnet[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false
  tags = {
    Name      = "terra_subnet_private_bo_06_${count.index}"
    createdBy = "terraform"
  }
}

resource "aws_subnet" "terra_public_subnet" {
  count = var.az_count
  vpc_id     = aws_vpc.terra_vpc.id
  cidr_block = var.public_subnet[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name      = "terra_subnet_public_bo_06_${count.index}"
    createdBy = "terraform"
  }
}

resource "aws_route_table" "terra_route_table" {
  vpc_id = aws_vpc.terra_vpc.id

  route {
    cidr_block = var.cidr_network
    gateway_id = "local"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terra_ig.id
  }
}

resource "aws_route_table_association" "terra_route_subnet_association" {
  count = var.az_count
  route_table_id = aws_route_table.terra_route_table.id
  subnet_id = aws_subnet.terra_public_subnet[count.index].id
}

resource "aws_internet_gateway" "terra_ig" {
  vpc_id = aws_vpc.terra_vpc.id
}