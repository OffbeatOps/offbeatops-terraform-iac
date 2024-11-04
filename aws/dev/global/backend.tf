module "dynamodb" {
  source = "github.com/yourorg/offbeatops-terraform-modules//aws/L2/dynamodb"
  
  account_id   = local.current_account.id
  account_name = local.current_account.name
  environment  = local.environment
  region       = local.region
  tags         = local.tags
}