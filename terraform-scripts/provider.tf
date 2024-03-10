terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "tf-backend-s3-0099"
    key    = "dev/terraform.tfstate"
    region = "us-east-2"
  }
}

# Configure the AWS Provider
provider "aws" {

}