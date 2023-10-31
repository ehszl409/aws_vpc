output "vpc_id" {
  value = aws_vpc.terra_vpc.id
  description = "생성된 VPC ID 정보입니다. "
}