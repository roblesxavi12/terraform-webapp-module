variable "gateway_name" {
  type    = string
  default = "main_igw"
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}
variable "tags" {
  type = map
  default = {}
}