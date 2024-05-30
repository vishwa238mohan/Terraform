resource "aws_lb" "mainLB" {
  name               = "loadbalance"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = var.subnet_ids

  enable_deletion_protection = false
  tags = {
    Name = "loadbalance"
  }
}

