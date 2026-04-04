terraform {
  backend "s3" {
    bucket       = var.backet_name
    key          = var.statefile_bucket_path
    region       = var.region
    use_lockfile = true
  }
}

