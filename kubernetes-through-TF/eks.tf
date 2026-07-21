module "eks" {
  #import module
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  #this is for cluster info(control plane)
  name               = local.name
  kubernetes_version = "1.33"

  endpoint_public_access = true

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true

  #   compute_config = {
  #     enabled    = true
  #     node_pools = ["general-purpose"]
  #   }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  addons = {
    vpc-cni = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    coredns = {
      most_recent = true
    }
  }


  #control plane network
  control_plane_subnet_ids = module.vpc.intra_subnets

  # managing node in the cluster
  # eks_managed_node_group_defaults = {
  # #   instance_types = ["t3.micro"]

  #   attach_cluster_primary_security_group = true
  # }


  eks_managed_node_groups = {
    tws_cluster_node_group = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      #   ami_type       = "AL2023_x86_64_STANDARD"

      instance_types                        = ["c7i-flex.large"]
      attach_cluster_primary_security_group = true


      min_size     = 2
      max_size     = 3
      desired_size = 2

      capacity_type = "SPOT"
      iam_role_additional_policies = {
        AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
      }
    }
  }

  tags = {
    Environment = local.env
    Terraform   = "true"
  }
}
