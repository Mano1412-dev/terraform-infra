output "current_region" {

  value = var.aws_region

}

output "environment" {

  value = var.environment

}

output "project_name" {

  value = var.project_name

}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}

output "public_subnet_1_id" {
  value = aws_subnet.public_subnet_1.id
}

output "public_subnet_2_id" {
  value = aws_subnet.public_subnet_2.id
}

output "private_subnet_1_id" {
  value = aws_subnet.private_subnet_1.id
}

output "private_subnet_2_id" {
  value = aws_subnet.private_subnet_2.id
}

output "nat_gateway_id" {

  value = aws_nat_gateway.main.id

}

output "elastic_ip" {

  value = aws_eip.nat.public_ip

}

output "public_security_group_id" {

  value = aws_security_group.public_sg.id

}

output "private_security_group_id" {

  value = aws_security_group.private_sg.id

}

output "ec2_role_name" {

  value = aws_iam_role.ec2_role.name

}

output "instance_profile" {

  value = aws_iam_instance_profile.ec2_profile.name

}

output "key_pair_name" {

  value = aws_key_pair.main.key_name

}

output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "bastion_instance_id" {
  value = aws_instance.bastion.id
}

output "jenkins_public_ip" {
  value = aws_instance.jenkins.public_ip
}

output "jenkins_instance_id" {
  value = aws_instance.jenkins.id
}

output "application_instance_ids" {

  value = {
    for name, instance in aws_instance.application :
    name => instance.id
  }

}

output "application_private_ips" {

  value = {
    for name, instance in aws_instance.application :
    name => instance.private_ip
  }

}