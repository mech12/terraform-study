resource "aws_lb" "akbun-alb" {
  name               = "t101-alb"
  load_balancer_type = "application"
  subnets            = [aws_subnet.akbun-subnet1.id, aws_subnet.akbun-subnet2.id]
  security_groups = [aws_security_group.akbun-mysg.id]

  tags = {
    Name = "t101-alb"
  }
}

resource "aws_lb_listener" "myhttp" {
  load_balancer_arn = aws_lb.akbun-alb.arn
  port              = 80
  protocol          = "HTTP"

  # By default, return a simple 404 page
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "404: page not found - T101 Study"
      status_code  = 404
    }
  }
}

resource "aws_lb_target_group" "myalbtg" {
  name = "t101-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.akbun-vpc.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200-299"
    interval            = 5
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

output "akbunalb_dns" {
  value       = aws_lb.akbun-alb.dns_name
  description = "The DNS Address of the ALB"
}

