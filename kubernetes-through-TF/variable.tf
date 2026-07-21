locals {
  region          = "us-west-1"
  name            = "EKS-cluster"
  vpc_cidr        = "10.0.0.0/16"
  azs             = ["us-west-1a", "us-west-1c"]
  public_subnet   = ["10.0.0.0/20", "10.0.16.0/20"]
  private_subnet  = ["10.0.128.0/20", "10.0.144.0/20"]
  intranet_subnet = ["10.0.32.0/24", "10.0.33.0/24"]
  env             = "dev"

}