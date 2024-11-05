#This is not represented in a module that I finished, but I'm leaving it here to discuss my ideal setup for EKS management

# module "eks_hub" {
#   source      = "github.com/yourorg/offbeatops-terraform-modules//aws/L3/eks_hub"

#   region      = module.aws_info.region
#   environment = module.aws_info.environment
#   name        = "hub-${module.aws_info.environment}"
#   vpc_cidr    = module.aws_info.vpc_cidr
#   subnets     = module.aws_info.subnets["private"]
# }