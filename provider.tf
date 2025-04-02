terraform {
  backend "s3" {
    bucket = "project-linuxtips"
    key    = "desenvolvimento"
    region = "us-west-2"
    use_lockfile = true
  }
    required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}