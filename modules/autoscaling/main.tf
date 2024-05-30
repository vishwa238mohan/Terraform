resource "aws_launch_configuration" "example" {
  name          = "example-launch-configuration"
  image_id      = var.ami_id
  instance_type = var.instance_type
  security_groups = var.security_group_ids

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "example" {
  launch_configuration = aws_launch_configuration.example.id
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  vpc_zone_identifier  = var.subnet_ids

  tag {
    key                 = "Name"
    value               = "example-asg"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "scale_up" {
  name                   = "scale_up"
  scaling_adjustment     = var.scale_up_adjustment
  adjustment_type        = "ChangeInCapacity"
  cooldown               = var.cooldown
  autoscaling_group_name = aws_autoscaling_group.example.name
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "scale_down"
  scaling_adjustment     = var.scale_down_adjustment
  adjustment_type        = "ChangeInCapacity"
  cooldown               = var.cooldown
  autoscaling_group_name = aws_autoscaling_group.example.name
}
