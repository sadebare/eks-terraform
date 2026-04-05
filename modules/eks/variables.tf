variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "cluster_version" {
  description = "Version of EKS to use for the cluster"
  type        = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "env" {
  description = "Environment name"
  type        = string
}

variable "authentication_mode" {
  description = "Authentication mode for the EKS cluster"
  type        = string
  default     = "API_AND_CONFIG_MAP"
}

variable "is_eks_cluster_enabled" {
  description = "Whether to enable the EKS cluster"
  type        = bool
  default     = true
}

variable "endpoint_private_access" {
  description = "whether to allow private access for the EKS Cluster"
  type        = bool
  default     = false
}

variable "endpoint_public_access" {
  description = "Whether to enable public access for the EKS cluster"
  type        = bool
  default     = true
}

variable "security_group_ids" {
  description = "List of security group IDs for the EKS cluster"
  type        = list(string)
}

variable "tags" {
  description = "Tags for the EKS cluster"
  type        = map(string)
}

variable "addons" {
  type = list(object({
    name    = string
    version = optional(string)
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

variable "ondemand_instance_types" {
  description = "Instance types for on-demand node group"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "eks_node_role_arn" {
  description = "ARN of the IAM Role to use for EKS Node Group"
  type        = string
}

variable "eks_cluster_role_arn" {
  description = "ARN of the IAM Role to use for EKS Cluster"
  type        = string
}