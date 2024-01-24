variable "cidr_vpc" {
  description = "CIDR para a VPC"
  type        = string

}

variable "cidr_subnet" {
  description = "CIDR para subnet"
  type        = string

}

variable "environment" {
  description = "Ambiente dos recursos criados"
  type        = string

}