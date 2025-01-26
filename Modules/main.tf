provider "aws" {
  region = "ap-south-1"
}

variable "ami" {
  description = "value of ami"
}

variable "instance_type" {
  description = "value of instance type"
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "stage" = "t2.medium"
    "prod" = "t2.micro"
  }
}

module "Ec2creation" {
  source = "./Modules/Ec2"
  ami = var.ami
  instance_type = lookup(var.instance_type,terraform.workspace,"error")  
}
