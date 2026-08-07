locals {

  name_prefix = "${var.project_name}-${var.environment}"

  common_tags = {

    Project = var.project_name

    Environment = var.environment

    ManagedBy = "Terraform"

    Owner = "SRE-Team"

    CostCenter = "IT"

    Application = var.project_name

  }

}