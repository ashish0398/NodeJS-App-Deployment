module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
}

module "iam" {
  source = "./modules/iam"
}

module "alb" {
  source     = "./modules/alb"
  alb_sg_id  = module.vpc.alb_sg_id
  subnet_ids = module.vpc.public_subnet_ids
  vpc_id     = module.vpc.vpc_id
  app_port   = 3000
}

module "ecs" {
  source                      = "./modules/ecs"
  app_image                   = "992382713153.dkr.ecr.ap-south-1.amazonaws.com/nodejs-app:latest"
  app_port                    = 3000

  # NEW: match ECS module variables
  private_subnet_ids          = module.vpc.private_subnet_ids
  public_subnet_ids           = module.vpc.public_subnet_ids
  use_private_subnets         = true   # ✅ if you want tasks in private subnets (recommended)
  # use_private_subnets       = false  # 👈 switch to this if debugging in public

  ecs_sg_id                   = module.vpc.ecs_sg_id
  alb_target_group_arn        = module.alb.target_group_arn
  ecs_task_execution_role_arn = module.iam.ecs_task_execution_role_arn
}