# ECS Cluster
resource "aws_ecs_cluster" "main" {
  name = "nodejs-cluster"
}

# ECS Task Definition
resource "aws_ecs_task_definition" "app" {
  family                   = "nodejs-app"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = var.ecs_task_execution_role_arn
  container_definitions    = jsonencode([{
    name      = "nodejs-app"
    image     = var.app_image
    essential = true
    portMappings = [{
      containerPort = var.app_port
      hostPort      = var.app_port
    }]
  }])
}

# ECS Service
resource "aws_ecs_service" "main" {
  name            = "nodejs-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = 2
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.subnet_ids
    security_groups = [var.ecs_sg_id]
  }

  load_balancer {
    target_group_arn = var.alb_target_group_arn
    container_name   = "nodejs-app"
    container_port   = var.app_port
  }
}
