terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.62.0"
    }
  }
}

# default
provider "aws" {
  region = "eu-west-1"
}

# west-1
provider "aws" {
  region = "eu-west-1"
  alias  = "west-1"
}

# west-2
provider "aws" {
  region = "eu-west-2"
  alias  = "west-2"
}

module "vpc_web_west1" {
  source   = "./mod-vpc/"
  providers = {
    aws = aws.west-1
  }
}

module "vpc_web_west2" {
  source   = "./mod-vpc/"
  providers = {
    aws = aws.west-2
  }
}
