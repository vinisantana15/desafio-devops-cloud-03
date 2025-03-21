terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.91.0"
  }
}
}
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.19.0"

  name = "my-vpc"
  cidr = "10.0.0.0/16"
  azs             = ["us-west-1", "us-west-1", "us-west-1"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"

  cluster_name = "var.aws_eks_name"
  cluster_version = "var.aws_eks_version"

  enable_cluster_creator_admin_permissions = true

  subnet_ids = module.vpc.private_subnets
  vpc_id = module.vpc.vpc_id

  cluster_endpoint_public_access = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
  eks_managed_node_groups = {
    aws = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_types   = "var.eks_managed_node_groups_instance_types"
    }
  }

}
