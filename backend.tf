terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    region  = "us-east-2"
    bucket  = "terraform-dpozzi-eks-cluster-tfstate-state"
    key     = "terraform.tfstate"
    profile = "terraform"
    encrypt = "true"

    dynamodb_table = "terraform-dpozzi-eks-tfstate-state-lock"
  }
}
