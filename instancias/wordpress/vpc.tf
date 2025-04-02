module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "VPC-blog"
  cidr = "10.254.0.0/16"

  azs             = ["us-west-2a", "us-west-2b"]
  private_subnets = ["10.254.0.0/24", "10.254.1.0/24"]
  public_subnets  = ["10.254.2.0/24", "10.254.3.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true
  manage_default_network_acl = false

  tags = {
    Terraform = "true"
  }
}