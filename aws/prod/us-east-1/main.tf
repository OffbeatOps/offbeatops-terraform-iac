module "backend" {
  source      = "github.com/yourorg/offbeatops-terraform-modules//aws/L1/backend"
  bucket_name = "prod-terraform-state"
  table_name  = "prod-terraform-locks"
}

output "backend_info" {
  value = module.backend
}
