variable "eks_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "is_eks_role_enabled" {
  type = bool
}

variable "is_eks_nodegroup_role_enabled" {
  type = bool
}

variable "is_alb_controller_enabled" {
  type = bool
}