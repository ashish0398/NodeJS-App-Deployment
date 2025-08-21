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

module "ecr" {
  source = "./modules/ecr"
}
module "ecs" {
  source                     = "./modules/ecs"
  app_image                   = "992382713153.dkr.ecr.ap-south-1.amazonaws.com/nodejs-app:latest"
  app_port                   = 3000
  subnet_ids                 = module.vpc.public_subnet_ids
  ecs_sg_id                  = module.vpc.ecs_sg_id
  alb_target_group_arn       = module.alb.target_group_arn
  ecs_task_execution_role_arn = module.iam.ecs_task_execution_role_arn
}
