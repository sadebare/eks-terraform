output "cluster_id" {
  description = "The name/id of the EKS cluster"
  value       = try(aws_eks_cluster.eks[0].id, null)
}

output "cluster_arn" {
  description = "The Amazon Resource Name (ARN) of the cluster"
  value       = try(aws_eks_cluster.eks[0].arn, null)
}

output "cluster_endpoint" {
  description = "Endpoint for your Kubernetes API server"
  value       = try(aws_eks_cluster.eks[0].endpoint, null)
}

output "cluster_version" {
  description = "The Kubernetes server version for the cluster"
  value       = try(aws_eks_cluster.eks[0].version, null)
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate with the cluster"
  value       = try(aws_eks_cluster.eks[0].certificate_authority[0].data, null)
}

output "oidc_provider_arn" {
  description = "ARN of the OIDC Provider"
  value       = try(aws_iam_openid_connect_provider.eks-oidc.arn, null)
}

output "oidc_provider_url" {
  description = "URL of the OIDC Provider"
  value       = try(aws_iam_openid_connect_provider.eks-oidc.url, null)
}