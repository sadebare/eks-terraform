variable "env_name" {
  description = "The environment name (e.g., dev, stage, prod)"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet CIDRs (e.g., ['10.0.1.0/24', '10.0.2.0/24'])"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet CIDRs (e.g., ['10.0.10.0/24', '10.0.11.0/24'])"
  type        = list(string)
}

variable "number_of_nat" {
  description = "Number of NAT Gateways to create. Use 1 for dev/stage to save costs, 3 for prod HA."
  type        = number
  default     = 1
}

variable "tags" {
  description = "A map of additional tags to add to all resources"
  type        = map(string)
  default     = {}
}