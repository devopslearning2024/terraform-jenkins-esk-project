# VPC
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "jenkins-vpc"
  cidr = var.vpc_cidr

  azs = data.aws_availability_zones.azs.names
  #   azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  #   private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets


  enable_dns_hostnames = true
  enable_nat_gateway   = true
  single_nat_gateway   = true
  #   enable_nat_gateway = true
  #   enable_vpn_gateway = true

  tags = {
    "kubernetes.io/cluster/my-esk-cluster" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/my-esk-cluster" = "shared"
    "kubernetes.io/role/elb"               = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/my-esk-cluster" = "shared"
    "kubernetes.io/role/internal-elb"      = 1
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "my-esk-cluster"
  cluster_version = "1.27"

  cluster_endpoint_public_access = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  #   control_plane_subnet_ids = ["subnet-xyzde987", "subnet-slkjf456", "subnet-qeiru789"]

  eks_managed_node_groups = {
    nodes = {
      min_size     = 1
      max_size     = 3
      desired_size = 2

      instance_types = ["t3.small"]
    }
  }

}

