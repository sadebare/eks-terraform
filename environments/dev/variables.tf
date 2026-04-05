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

variable "desired_capacity_on_demand" {
  description = "Desired capacity for on-demand node group"
  type        = number
}
variable "max_capacity_on_demand" {
  description = "Maximum capacity for on-demand node group"
  type        = number
}
variable "min_capacity_on_demand" {
  description = "Minimum capacity for on-demand node group"
  type        = number
}
variable "desired_capacity_spot" {
  description = "Desired capacity of spot instances"
  type        = number
}
variable "max_capacity_spot" {
  description = "Maximum capacity for spot node group"
  type        = number
}
variable "min_capacity_spot" {
  description = "Minimum capacity for spot node group"
  type        = number
}
variable "spot_instance_types" {
  description = "spot instance types for the spot node group"
  type        = list(string)
}
variable "tags" {
  description = "Tags for the EKS cluster and its resources"
  type        = map(string)
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
}

variable "endpoint_private_access" {
  description = "Enable private access to the EKS cluster endpoint"
  type        = bool
}

variable "endpoint_public_access" {
  description = "Enable public access to the EKS cluster endpoint"
  type        = bool
}