//created public subnets
resource "aws_subnet" "public" {
  vpc_id    = var.vpc_id
  count = 3
  cidr_block = var.public_subnet[count.index]
  map_public_ip_on_launch = true
 

  tags = {
    Name = "TF_publicsubnet"
  }
}

//created private subnets
resource "aws_subnet" "private" {
  count = 3
  vpc_id     = var.vpc_id
  cidr_block = var.private_subnet[count.index]
  map_public_ip_on_launch = false


  tags = {
    Name = "TF_privatesubnet"
  }
}