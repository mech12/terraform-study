resource "aws_lb" "akbun-alb" {
  name               = "t101-alb"
  load_balancer_type = "application"
  subnets            = [aws_subnet.akbun-subnet1.id, aws_subnet.akbun-subnet2.id]
  security_groups = [aws_security_group.akbun-mysg.id]

  tags = {
    Name = "t101-alb"
  }
}

output "akbunalb_dns" {
  value       = aws_lb.akbun-alb.dns_name
  description = "The DNS Address of the ALB"
}

