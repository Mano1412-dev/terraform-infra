resource "aws_vpc" "main" {

  cidr_block = var.vpc_cidr

  enable_dns_support = true

  enable_dns_hostnames = true

  tags = {

    Name = "${var.project_name}-${var.environment}-vpc"

    Project = var.project_name

    Environment = var.environment

    ManagedBy = "Terraform"

    Owner = "SRE-Team"

  }

}

resource "aws_subnet" "public_subnet_1" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.public_subnet_1_cidr

  availability_zone = "ap-south-1a"

  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.project_name}-${var.environment}-public-subnet-1"
    Project     = var.project_name
    Environment = var.environment
    Tier        = "Public"
  }
}

resource "aws_subnet" "public_subnet_2" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.public_subnet_2_cidr

  availability_zone = "ap-south-1b"

  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.project_name}-${var.environment}-public-subnet-2"
    Project     = var.project_name
    Environment = var.environment
    Tier        = "Public"
  }
}

resource "aws_subnet" "private_subnet_1" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.private_subnet_1_cidr

  availability_zone = "ap-south-1a"

  tags = {
    Name        = "${var.project_name}-${var.environment}-private-subnet-1"
    Project     = var.project_name
    Environment = var.environment
    Tier        = "Private"
  }
}

resource "aws_subnet" "private_subnet_2" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.private_subnet_2_cidr

  availability_zone = "ap-south-1b"

  tags = {
    Name        = "${var.project_name}-${var.environment}-private-subnet-2"
    Project     = var.project_name
    Environment = var.environment
    Tier        = "Private"
  }
}