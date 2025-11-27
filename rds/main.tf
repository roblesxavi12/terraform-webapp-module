provider "aws"{
    region = "eu-west-1"
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/rds_engine_version
data "aws_rds_engine_version" "default" {
    engine = "aurora"
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance
resource "aws_db_instance" "web_db" {
    allocated_storage = 10
    max_allocated_storage = 20
    allow_major_version_upgrade = true
    auto_minor_version_upgrade = true # las minors no deberian rebentar la rds
    db_name = "my_db"
    engine = data.aws_rds_engine_version.engine
    username = ""
    password = ""
    
    
}