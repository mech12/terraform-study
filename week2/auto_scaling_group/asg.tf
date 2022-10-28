resource "aws_autoscaling_group" "akbun-asg" {
  launch_configuration = aws_launch_configuration.akbun-launchconfig.name
  vpc_zone_identifier  = [aws_subnet.akbun-subnet1.id, aws_subnet.akbun-subnet2.id]

  min_size = 1
  max_size = 4

  tag {
    key                 = "Name"
    value               = "terraform-asg"
    propagate_at_launch = true
  }
}

# 샘플 코드 : 실행을 하지는 않음
resource "aws_launch_configuration" "akbun-launchconfig" {
  image_id        = data.aws_ami.my_amazonlinux2.id
  instance_type   = "t2.nano"
  security_groups = [aws_security_group.akbun-mysg.id]
}