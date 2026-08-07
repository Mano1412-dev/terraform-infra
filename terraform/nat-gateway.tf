resource "aws_nat_gateway" "main" {

  allocation_id = aws_eip.nat.id

  subnet_id = aws_subnet.public_subnet_1.id

  connectivity_type = "public"

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-nat"
    }
  )

  depends_on = [
    aws_internet_gateway.main
  ]

}