// Include the centralized locals
module "account_info" {
  source = "github.com/yourorg/offbeatops-terraform-modules//aws/locals.tf"
}

// Derive the region and environment from the directory structure
locals {
  path_parts    = split("/", path.cwd)  // Split the current working directory into parts
  environment   = local.path_parts[2]   // Assuming the structure is aws/{environment}/{region}
  region        = local.path_parts[3]    // Get the region part

  // Set region to 'us-east-1' if the folder is 'global'
  region        = local.region == "global" ? "us-east-1" : local.region
  
  // Reference the account mappings using the environment
  current_account = local.account_mappings[local.environment]  // Uses the environment as the key
}

module "aws_null_label" {
  source      = "github.com/yourorg/offbeatops-terraform-modules//aws/L1/aws_null_label"
  
  namespace     = "your-namespace"
  account_id    = local.current_account.id
  account_name  = local.current_account.name
  environment   = local.environment
  region        = local.region
  owner         = "team-xyz"  // Assuming owner is a constant or can be derived differently
}

output "labels" {
  value = module.aws_null_label.labels
}
