terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.62.0"
    }
  }
}

resource "aws_vpc" "web_vpc" {
  cidr_block = "10.202.0.0/16"
}