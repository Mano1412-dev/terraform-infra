resource "aws_security_group" "public_sg" {

  name = "${local.name_prefix}-public-sg"

  description = "Public Security Group"

  vpc_id = aws_vpc.main.id

  ingress {

    description = "SSH"

    from_port = 22

    to_port = 22

    protocol = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
    ]

  }

  ingress {

    description = "HTTP"

    from_port = 80

    to_port = 80

    protocol = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
    ]

  }

  ingress {

    description = "HTTPS"

    from_port = 443

    to_port = 443

    protocol = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
    ]

  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]

  }

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-public-sg"
    }
  )

}

resource "aws_security_group" "private_sg" {

  name = "${local.name_prefix}-private-sg"

  description = "Private Security Group"

  vpc_id = aws_vpc.main.id

  ingress {

    description = "SSH from Public SG"

    from_port = 22

    to_port = 22

    protocol = "tcp"

    security_groups = [
      aws_security_group.public_sg.id
    ]

  }

  ingress {

    description = "Application"

    from_port = 8080

    to_port = 8080

    protocol = "tcp"

    security_groups = [
      aws_security_group.public_sg.id
    ]

  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]

  }

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-private-sg"
    }
  )

}