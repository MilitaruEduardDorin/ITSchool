
terraform {
  backend "s3" {
    bucket         = "terraform-state-dev"
    key            = "state.tfstate"
    region         = "us-east-1"
    access_key     = "test"
    secret_key     = "test"
    use_path_style           = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    endpoints = {
        s3  = "http://localhost:4566"
        ec2 = "http://localhost:4566"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.98"
    }
  }
}


provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  s3_use_path_style           = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    ec2 = "http://localhost:4566"
    s3  = "http://localhost:4566"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

output "zone_names" {
  value = data.aws_availability_zones.available.names
}
