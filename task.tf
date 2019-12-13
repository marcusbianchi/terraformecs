resource "aws_ecs_task_definition" "nginx" {
  family = "nginx"
  network_mode = "bridge"

  container_definitions = <<DEFINITION
[
    {
      "name": "nginx",
      "image": "nginx",
      "memory": 128
      ,
      "ulimits": [
        {
          "softLimit": 65536,
          "hardLimit": 65536,
          "name": "nofile"
        }
      ],
      "portMappings": [
        {
          "hostPort": 80,
          "containerPort": 80,
          "protocol": "tcp"
        }
      ]    
    }
  ]
DEFINITION
}
