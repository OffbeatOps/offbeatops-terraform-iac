resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "qa-terraform-state"

  tags = {
    Name        = "qa-terraform-state"
    Environment = "qa"
    Owner       = "DevOps"
    Purpose     = "Terraform state storage"
  }
}