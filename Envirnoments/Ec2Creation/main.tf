provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "Ec2creation" {
  ami = var.ami
  instance_type = var.instance_type
}

variable "ami" {
  description = "value of ami"
}

variable "instance_type" {
  description = "value of instance type"
}
