variable "vpc_id" {
  description = "id for vpc"
  type = string
}

variable "internet_gateway_id" {
  description = "id of igw"
  type = string
}

variable "public_subnet_ids" {
  description = "list of public subnets"
  type = list(string)
}

variable "private_subnet_ids" {
  description = "list of private subnets"
  type = list(string)
}

variable "nat_gateway_id" {
  description = "id of nat gateway"
  type = string
}