#For now we only use the AWS ECS optimized ami <https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html>
data "aws_ami" "amazon_linux_ecs" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-*-amazon-ecs-optimized"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
}


resource "aws_launch_configuration" "ecs-launch-configuration" {
  name_prefix                 = "ecs-launch-configuration"
  image_id                    = data.aws_ami.amazon_linux_ecs.id
  instance_type               = var.ec2_instance_type
  key_name                    = var.ec2_key_name
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.ecs-instance-profile.id
  security_groups             = [aws_security_group.public_sg.id]

  user_data = <<EOF
                                  #!/bin/bash
                                  sysctl -w vm.max_map_count=262144
                                  sysctl -w fs.file-max = 65536
                                  sysctl -w vm.swappiness = 1
                                  echo ECS_CLUSTER=ecs-cluster >> /etc/ecs/ecs.config
                                  EOF
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "ecs-autoscaling-group" {
  name                 = "ecs-autoscaling-group"
  max_size             = var.ec2_count_max
  min_size             = var.ec2_count_min
  desired_capacity     = var.ec2_count
  vpc_zone_identifier  = [aws_subnet.ecs_public_sn_01.id, aws_subnet.ecs_public_sn_02.id, aws_subnet.ecs_public_sn_03.id]
  launch_configuration = aws_launch_configuration.ecs-launch-configuration.name
  health_check_type    = "EC2"
}

resource "aws_ecs_cluster" "ecs-cluster" {
  name = "ecs-cluster"
}

