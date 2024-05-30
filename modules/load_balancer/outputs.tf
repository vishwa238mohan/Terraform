output "load_balancer_arn" {
  value = aws_lb.mainLB.arn
}

output "load_balancer_dns_name" {
  value = aws_lb.mainLB.dns_name
}
