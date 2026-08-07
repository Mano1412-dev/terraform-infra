locals {

  name_prefix = "${var.project_name}-${var.environment}"

  common_tags = {

    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = "SRE-Team"
    CostCenter  = "IT"
    Application = var.project_name

  }

  app_servers = {

    stage = {
      subnet_id     = aws_subnet.private_subnet_1.id
      instance_type = "t3.micro"
    }

    prod = {
      subnet_id     = aws_subnet.private_subnet_2.id
      instance_type = "t3.micro"
    }

  }

}