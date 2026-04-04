locals {
  Name        = "${var.env_name}-vpc"
  Environment = var.env_name
  region      = var.region
  ManagedBy   = "terraform"
  Version     = "1.0.0" # Track version here instead of the name
  Owner       = "DevOps-Team"
}