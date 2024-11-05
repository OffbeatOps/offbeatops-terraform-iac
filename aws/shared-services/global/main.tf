terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "shared-services-terraform-state"
    key            = "state/shared-services-terraform-state-global.tfstate"
    region         = "us-east-1"
    dynamodb_table = "shared-services-terraform-locks"
    encrypt        = true
  }
}

// Define the AWS provider with the derived region
provider "aws" {
  region = local.region
}

// Derive the region and environment from the directory structure
locals {
  path_parts  = split("/", path.cwd) // Split the current working directory into parts
  environment = local.path_parts[2]   // Assuming the structure is aws/{environment}/{region}
  region      = local.path_parts[3]    // Get the region part

  // Set region to 'us-east-1' for configuration, but keep 'global' for naming if applicable
  effective_region = local.region == "global" ? "us-east-1" : local.region
  region_name_part = local.region == "global" ? "global" : local.region

  // Derive the table name using environment and region name part (preserve 'global')
  table_name = join("-", ["dynamodb", local.environment, local.region_name_part])
}

module "dynamodb" {
  source     = "github.com/yourorg/offbeatops-terraform-modules//aws/L1/dynamodb"
  table_name = local.table_name
  tags       = module.aws_info.tags
}

// S3 bucket for the global environment, shared across other environments
resource "aws_s3_bucket" "shared_bucket" {
  bucket = "shared-${local.environment}-bucket"
  acl    = "private"

  tags = merge(
    module.aws_info.tags,  // Standardized tags from aws_info module
    {
      "Name" = "shared-${local.environment}-bucket"
    }
  )
}

// Include the aws_info module
module "aws_info" {
  source   = "github.com/yourorg/offbeatops-terraform-modules//aws/L1/aws_info"
  environment = local.environment
  region      = local.region
}