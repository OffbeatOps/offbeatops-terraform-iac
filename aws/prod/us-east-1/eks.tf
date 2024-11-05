module "eks" {
  source      = "github.com/yourorg/offbeatops-terraform-modules//aws/L3/eks_with_karpenter"
  environment = local.environment
  region      = local.region
  vpc_cidr    = module.aws_info.vpc_cidr
  tags        = module.aws_info.tags
}