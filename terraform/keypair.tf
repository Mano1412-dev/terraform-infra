resource "aws_key_pair" "main" {

  key_name = "${local.name_prefix}-key"

  public_key = file("${path.module}/keys/shopkart.pub")

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-key"
    }
  )
}