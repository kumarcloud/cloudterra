terraform{
    required_providers {
      aws = {
          source = "hashicorp/aws"
      }
    }
    backend "remote" {
       organization = "cloudterra"
       workspaces {
         name = "cloudterra"
       }
    }
}

provider "aws" {
   region = "ap-south-1"
   access_key = var.aws_access_key
   secret_key = var.aws_secret_key
}

resource "aws_instance" "demoe" {
  ami = "ami-0108d6a82a783b352"
  instance_type = "t2.micro"
  tags = {
      "name" = "myawsinstace"
  }
}