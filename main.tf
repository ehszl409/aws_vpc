resource "aws_vpc" "terra_vpc" {
  cidr_block = var.cidr_network
  tags = {
    Name = "terra_vpc"
    createBy = "terraform"
  }
}

