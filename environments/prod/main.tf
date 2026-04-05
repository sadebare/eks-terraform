module "vpc" {
  source          = "../../modules/vpc"
  env_name        = var.env_name
  vpc_cidr        = var.vpc_cidr
  private_subnets = var.private_subnet_cidr
  public_subnets  = var.public_subnet_cidr
  number_of_nat   = var.number_of_nat
}

module "iam" {
  source = "../../modules/iam"
  eks_name = var.eks_name
  is_eks_role_enabled = var.is_eks_role_enabled
  is_eks_nodegroup_role_enabled = var.is_eks_nodegroup_role_enabled
  is_alb_controller_enabled = var.is_alb_controller_enabled
  
  depends_on = [module.vpc]
}

module "eks" {
  source = "../../modules/eks"
  cluster_name = var.eks_name
  cluster_version = var.cluster_version
  env = var.env_name
  subnet_ids = module.vpc.private_subnet_ids
  security_group_ids = []
  eks_node_role_arn = module.iam.eks_nodegroup_role_arn
  eks_cluster_role_arn = module.iam.eks_cluster_role_arn
  addons = var.addons
  desired_capacity_on_demand = var.desired_capacity_on_demand
  min_capacity_on_demand = var.min_capacity_on_demand
  max_capacity_on_demand = var.max_capacity_on_demand
  desired_capacity_spot = var.desired_capacity_spot
  min_capacity_spot = var.min_capacity_spot
  max_capacity_spot = var.max_capacity_spot
  spot_instance_types = var.spot_instance_types
  ondemand_instance_types = ["t3.medium"]
  tags = var.tags
  
  depends_on = [module.vpc, module.iam]
}