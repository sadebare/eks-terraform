terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.7.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~>3.1.1"
    }
  }
}

provider "aws" {
  # Configuration options
  region = local.region
}