provider "aws" {
  region                      = "us-east-1"
  access_key                  = "dummy"
  secret_key                  = "dummy"
  skip_credentials_validation = true
  skip_region_validation      = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/rds_engine_version
data "aws_rds_engine_version" "default" {
    engine = var.engine
}

resource "aws_db_subnet_group" "db_sn_group" {
  name       = "main"
  subnet_ids = var.rds_subnets
  tags = {
    Name = "My DB subnet group"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance
resource "aws_db_instance" "web_db" {
    allocated_storage = var.allocated_storage
    max_allocated_storage = var.max_allocated_storage
    allow_major_version_upgrade = true
    auto_minor_version_upgrade = true # las minors no deberian rebentar la rds
    db_name = var.db_name
    engine = data.aws_rds_engine_version.engine
    username = var.username
    password = var.passwd
    aws_db_subnet_group = aws_db_subnet_group.db_sn_group.name
}