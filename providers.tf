provider "aws" {
  region = "${local.region}"
  profile = "${var.AWS_PROFILE}"
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.this.endpoint
#    token                  = data.terraform_remote_state.eks.outputs.EKS_cluster_auth_token
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority.0.data)
    config_path = "~/.kube/config"
    exec {
      api_version = "client.authentication.k8s.io/v1"
      args        = ["eks", "get-token", "--cluster-name", local.cluster_name]
      command     = "aws"
    }
  # load_config_file       = false
  }
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.this.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority.0.data)
  exec {
    api_version = "client.authentication.k8s.io/v1"
    args        = ["eks", "get-token", "--cluster-name", local.cluster_name]
    command     = "aws"
  }
  config_path = "~/.kube/config"
# load_config_file       = false
}
