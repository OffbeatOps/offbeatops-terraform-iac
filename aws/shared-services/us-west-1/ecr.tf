resource "aws_ecr_repository" "platform_images" {
  name = "platform-images"
  image_scanning_configuration {
    scan_on_push = true
  }

  tags = module.aws_info.tags
}