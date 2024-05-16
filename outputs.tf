# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value       = module.eks.cluster_security_group_id
}

output "region" {
  description = "AWS region"
  value       = var.region
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_name
}
output "aws_eks_cluster" {
  description = "kubeconfig"
  value  = "${local.kubeconfig}"
  sensitive = true
}

output "EKS_cluster_id" {
  value       = module.eks.cluster_id
  description = "EKS_cluster_id"
  sensitive = true
}

output "EKS_cluster_name" {
  value       = "${local.cluster_name}"
  description = "EKS_cluster_name"
  sensitive = true
}

output "EKS_cluster_endpoint" {
  value       = data.aws_eks_cluster.this.endpoint
  description = "EKS_cluster_endpoint"
  sensitive = true
}

output "EKS_cluster_auth_token" {
  value       = data.aws_eks_cluster_auth.this.token
  description = "EKS_cluster_auth_token"
  sensitive = true
}

output "EKS_cluster_CA_data" {
  value       = data.aws_eks_cluster.this.certificate_authority.0.data
  description = "EKS_cluster_CA_data"
  sensitive = true
}
