//elastic ip
resource "aws_eip" "new_eip" {
  domain   = "vpc"
  tags = {
      Name = "elasticIP"
  }
}

//NAT gateway
 resource "aws_nat_gateway" "ngw" {
   allocation_id = aws_eip.new_eip.id
   subnet_id     = var.private_subnet_ids[0]
     tags = {
    name = "NGW"
   }
}