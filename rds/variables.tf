variable "username"{
    type = string
    default = "default_user"
}
# obligatorio crear un usuario y su passwd
variable "passwd" {
    type = string
    # default = "1234"
}
variable "db_name" {
    type = string
    # default = "my_db"
}
/*
quiza no se puede estandarizar la eleccion del engine
porque seguramente haya opciones propias de cada engine 
en los diferentes resources
*/
variable "engine" {
    type = string
    default = "aurora"
}
variable "allocated_storage" {
    type = number
    default = 10
}
variable "max_allocated_storage" {
    type = number
    default = 20
}

variable "rds_subnets" {
    value = list(string)
}