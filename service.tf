
resource "aws_ecs_service" "ecs-service" {
  name            = "ecs-service"
  iam_role        = aws_iam_role.ecs-service-role.name
  cluster         = aws_ecs_cluster.ecs-cluster.id
  task_definition = aws_ecs_task_definition.nginx.arn

  desired_count = 3

  load_balancer {
    target_group_arn = aws_alb_target_group.ecs-target-group.arn
    container_port   = 80
    container_name   = "nginx"
  }
  placement_constraints {
    type = "distinctInstance"
  }
}