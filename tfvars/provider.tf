terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.25.0"
    }
  }
   backend "s3" {}
}

provider "aws" {
  # Configuration options
}