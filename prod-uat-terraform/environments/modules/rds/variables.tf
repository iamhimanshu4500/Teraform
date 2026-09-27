variable "environment" {}

variable "db_class" {}

variable "username" {}

variable "password" {
  sensitive = true
}

variable "multi_az" {}
