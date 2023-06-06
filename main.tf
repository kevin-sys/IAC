terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "app_server1" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance-${var.username}"
  }
}

resource "aws_instance" "app_server2" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance-${var.username}"
  }
}

variable "username" {
  description = "Usuario de kevin Gómez Cantillo en AWS"
  default     = "kevin-sys"
}
module "myecr" {
  source = "./modules/ecr"
}