resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "prod-terraform-state"

  tags = {
    Name        = "prod-terraform-state"
    Environment = "prod"
    Owner       = "DevOps"
    Purpose     = "Terraform state storage"
  }
}