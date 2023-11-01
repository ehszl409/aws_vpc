variable "az_count" {
  type = number
  description = "사용할 가용 영역의 수를 작성하세요."
  default = 1
}

variable "cidr_network" {
    type = string
    description = "VPC 에서 사용할 CIDR 네트워크 정보를 입력하세요."
    default = "10.0.0.0/16"
}

variable "private_subnet" {
  type = list(string)
  description = "프라이빗 서브넷 CIDR 범위를 작성하세요. az_count와 동일한 수량을 가져야 합니다."
}

variable "public_subnet" {
  type = list(string)
  description = "퍼블릭 서브넷 CIDR 범위를 작성하세요. az_count와 동일한 수량을 가져야 합니다."
}
