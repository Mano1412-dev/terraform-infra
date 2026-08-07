resource "aws_instance" "bastion" {

  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.public_subnet_1.id

  vpc_security_group_ids = [
    aws_security_group.public_sg.id
  ]

  key_name = aws_key_pair.main.key_name

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  associate_public_ip_address = true

  user_data = file("${path.module}/scripts/user-data.sh")

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-bastion"
      Role = "Bastion"
    }
  )

}

resource "aws_instance" "jenkins" {

  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.public_subnet_2.id

  associate_public_ip_address = true

  key_name = aws_key_pair.main.key_name

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  vpc_security_group_ids = [
    aws_security_group.public_sg.id
  ]

  user_data = file("${path.module}/scripts/jenkins-user-data.sh")

  root_block_device {
    volume_size           = 30
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-jenkins"
      Role = "Jenkins"
    }
  )
}

resource "aws_instance" "application" {

  for_each = local.app_servers

  ami = data.aws_ami.amazon_linux.id

  instance_type = each.value.instance_type

  subnet_id = each.value.subnet_id

  vpc_security_group_ids = [
    aws_security_group.private_sg.id
  ]

  key_name = aws_key_pair.main.key_name

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  associate_public_ip_address = false

  user_data = file("${path.module}/scripts/user-data.sh")

  root_block_device {

    volume_size = 20

    volume_type = "gp3"

    delete_on_termination = true

  }

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-${each.key}"
      Role = each.key
    }
  )

}