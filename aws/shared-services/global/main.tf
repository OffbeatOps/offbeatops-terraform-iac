resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "shared-services-terraform-state"

  tags = {
    Name        = "shared-services-terraform-state"
    Environment = "shared-services"
    Owner       = "DevOps"
    Purpose     = "Terraform state storage"
  }
}
