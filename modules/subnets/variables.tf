variable "public_subnet" {
  description = "List of cidr blocks for the public subnets"
  type = list(string)
}

variable "private_subnet" {
  description = "List of cidr blocks for the public subnets"
  type = list(string)
}

variable "vpc_id" {
  description= "id of vpc"
  type = string
}

