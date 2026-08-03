terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.98.0"
    }
  }

  backend "s3" {
    bucket = "10am-remote-state"
    key    = "provisioners-remote"
    region = "us-east-1"
    # dynamodb_table= "11am-remote-state-lock"
    encrypt       = true
    use_lockfile  = true
  }
}

provider "aws" {
  # Configuration options
}