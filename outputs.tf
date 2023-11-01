output "vpc_id" {
    value = aws_vpc.terra_vpc.id
    description = "생성된 VPC ID 정보 입니다."
}

output "public_subnet" {
    value = aws_subnet.terra_public_subnet.*
}

output "private_subnet" {
    value = aws_subnet.terra_private_subnet.*
}

output "debuging" {
    value = data.aws_availability_zones.available
}