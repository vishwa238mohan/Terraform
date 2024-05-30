//route table and association for public subnets
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }
   tags = {
     Name = "TF_routetable"
  }
}

resource "aws_route_table_association" "rt_public" {
  count = 3
  subnet_id = var.public_subnet_ids[count.index]
  route_table_id = aws_route_table.public.id
}


//route table and association of private subnets
resource "aws_route_table" "private" {
  vpc_id = var.vpc_id
   
   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.nat_gateway_id
  }
   tags = {
     Name = "TF_routetable"
  }
}

resource "aws_route_table_association" "rt_private" {
  count = 3
  subnet_id = var.private_subnet_ids[count.index]
  route_table_id = aws_route_table.private.id
}

