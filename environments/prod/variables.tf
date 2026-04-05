variable "env_name" {}
variable "region" {}
variable "vpc_cidr" {}
variable "private_subnet_cidr" {}
variable "public_subnet_cidr" {}
variable "number_of_nat" {}
variable "bucket_name" {}
variable "statefile_bucket_path" {}
variable "eks_name" {}
variable "is_eks_role_enabled" {}
variable "is_eks_nodegroup_role_enabled" {}
variable "is_alb_controller_enabled" {}

variable "addons" {
  type = list(object({
    name    = string
    version = string
  }))
}

variable "desired_capacity_on_demand" {}
variable "max_capacity_on_demand" {}
variable "min_capacity_on_demand" {}
variable "desired_capacity_spot" {}
variable "max_capacity_spot" {}
variable "min_capacity_spot" {}
variable "spot_instance_types" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}
