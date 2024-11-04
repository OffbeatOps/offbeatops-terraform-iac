module "backend" {
  source      = "github.com/yourorg/offbeatops-terraform-modules//aws/L1/backend"
  bucket_name = "dev-terraform-state"
  table_name  = "dev-terraform-locks"
}

output "backend_info" {
  value = module.backend
}
