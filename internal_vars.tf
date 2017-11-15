variable "vpc_legacy_cidr" {
  default = "10.201.0.0/16"
}

variable "vpc_public_cidr" {
  default = "10.201.201.0/22"
}

variable "vpc_private_cidr" {
  default = "10.201.1.0/21"
}

variable "subnet_private_a" {
  default = "10.201.1.0/24"
}

variable "subnet_private_b" {
  default = "10.201.2.0/24"
}

variable "subnet_private_c" {
  default = "10.201.3.0/24"
}

variable "subnet_rds_a" {
  default = "10.201.4.0/24"
}

variable "subnet_rds_b" {
  default = "10.201.5.0/24"
}

variable "subnet_rds_c" {
  default = "10.201.6.0/24"
}

variable "subnet_public_a" {
  default = "10.201.201.0/24"
}

variable "subnet_public_b" {
  default = "10.201.202.0/24"
}

variable "subnet_public_c" {
  default = "10.201.203.0/24"
}
