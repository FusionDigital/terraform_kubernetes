# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
#  backend "s3" {
#    bucket = "terraform-dpozzi-eks-cluster-tfstate-state"
#    encrypt = true
#    key = "terraform.tfstate"
#    profile = "terraform"
#  }
  # cloud {
  #   workspaces {
  #     name = "learn-terraform-eks"
  #   }
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
#      version = "~> 5.47.0"
    }

    random = {
      source  = "hashicorp/random"
#      version = "~> 3.6.1"
    }

    helm = {
      source = "hashicorp/helm"
 #     version = "~>2.4.1"
    }
    
    cloudinit = {
      source = "hashicorp/cloudinit"
#      version     = "~>2.2.0"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
#      version     = "~>2.7.1"
    }

    local = {
      source = "hashicorp/local"
#      version = "~>2.1.0"
    }
    tls = {
      source  = "hashicorp/tls"
 #     version = "~> 4.0.5"
    }

    kubectl = {
      source  = "gavinbunney/kubectl"
#      version = ">= 1.7.0"
    }
  }

#  required_version = "~> 1.3"
}

