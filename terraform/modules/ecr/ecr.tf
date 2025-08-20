resource "aws_ecr_repository" "nodejs_app" {
  name                 = "nodejs-app" # Name of your ECR repository
  image_tag_mutability = "MUTABLE"    # Allow image tags to be overwritten
}
