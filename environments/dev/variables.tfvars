env_name                      = "demo-uat"
region                        = "us-east-1"
vpc_cidr                      = "172.53.0.0/16"
number_of_nat                 = 3
private_subnet_cidr           = ["172.53.1.0/24", "172.53.2.0/24", "172.53.3.0/24"]
public_subnet_cidr            = ["172.53.4.0/24", "172.53.5.0/24", "172.53.6.0/24"]
bucket_name                   = "shittu-barry-terraform-state"
statefile_bucket_path         = "dev/terraform.tfstate"
eks_name                      = "demo-uat-eks-cluster"
is_eks_role_enabled           = true
is_eks_nodegroup_role_enabled = true
is_alb_controller_enabled     = true
addons = [
  {
    name = "vpc-cni"
  },
  {
    name = "coredns"
  },
  {
    name = "kube-proxy"
  },
  {
    name = "aws-efs-csi-driver"
  },
#   {
#     name = "aws-ebs-csi-driver"
#   },
  {
    name = "eks-pod-identity-agent"
  }
]
desired_capacity_on_demand = 2
max_capacity_on_demand     = 2
min_capacity_on_demand     = 1

desired_capacity_spot = 2
max_capacity_spot     = 2
min_capacity_spot     = 1
spot_instance_types   = ["c5a.large", "c5a.xlarge", "m5a.large", "m5a.xlarge", "c5.large", "m5.large", "t3a.large", "t3a.xlarge", "t3a.medium"]

tags = {
  Environment = "uat"
  Project     = "eks-terraform"
}
cluster_version         = "1.35"
endpoint_private_access = true
endpoint_public_access  = true
