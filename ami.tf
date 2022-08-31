provider "aws" {
  region = "us-east-1"
}


terraform {
  backend "s3" {
    bucket = "terraform-kvbucket"
    key    = "ami/frontend/terraform.tfstate"
    region = "us-east-1"
  }
}

module "ami" {
  source      = "github.com/krishnavamsi7616/immutable-app-ami"
  COMPONENT   = "payment"
  APP_VERSION = var.APP_VERSION
}

variable "APP_VERSION" {}
