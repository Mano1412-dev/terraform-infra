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