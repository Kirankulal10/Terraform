terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
backend "s3" {
  bucket         = "terraform-bucket-kiran-backend"
  key            = "terraform.tfstate"
  region         = "us-west-1"
  dynamodb_table = "dynamo-kiran-table"
}

}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-1"
}







