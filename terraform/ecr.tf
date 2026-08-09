resource "aws_ecr_repository" "shopkart_api" {
  name                 = "shopkart-api"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-ecr-shopkart-api"
      Role = "ContainerRegistry"
    }
  )
}