output "rds_subnet_is" {
    value = [aws_subnet.rds_subnet1.id, aws_subnet.rds_subnet2.id]
}