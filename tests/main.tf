provider "aws" {
  region  = var.region
}

variable "sg_name" {
  default = "terraform-testing-sg"
}
variable "vpc_id" {
  default = ""
}
variable "region" {
  default = "us-west-2"
}

variable "description" {
  default = "terraform-testing"
}


variable "ingress_rules" {
  type        = list(string)
  default     = ["ssh-tcp"]
}

variable "ingress_cidr_blocks" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "name_prefix" {
  default = "terraform-testing"
}

module "test-sg" {
  source = "../"

  name                = var.sg_name
  description         = var.description
  vpc_id              = var.vpc_id
  ingress_rules       = var.ingress_rules
  ingress_cidr_blocks = var.ingress_cidr_blocks

}

