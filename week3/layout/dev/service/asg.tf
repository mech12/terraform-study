data "template_file" "user_data" {
  template = file("service/user-data.sh")

  vars = {
    server_port = 8080
    db_address  = var.db_address
    db_port     = var.db_port
  }
}

data "aws_ami" "my_amazonlinux2" {
  most_recent = true
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }

  owners = ["amazon"]
}

resource "aws_launch_configuration" "mylauchconfig" {
  name_prefix     = "t101-lauchconfig-"
  image_id        = data.aws_ami.my_amazonlinux2.id
  instance_type   = "t2.nano"
  security_groups = [aws_security_group.mysg.id]
  associate_public_ip_address = true

  # Render the User Data script as a template
  user_data = data.template_file.user_data.rendered

  # Required when using a launch configuration with an auto scaling group.
  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    data.template_file.user_data
  ]
}

resource "aws_autoscaling_group" "myasg" {
  name                 = "myasg"
  launch_configuration = aws_launch_configuration.mylauchconfig.name
  vpc_zone_identifier  = [aws_subnet.mysubnet1.id, aws_subnet.mysubnet2.id]
  health_check_type = "ELB"
  target_group_arns = [aws_lb_target_group.myalbtg.arn]
  min_size = 2
  max_size = 10

  tag {
    key                 = "Name"
    value               = "terraform-asg"
    propagate_at_launch = true
  }

  termination_policies = [
    "OldestLaunchConfiguration"
  ]

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
  }
}
