terraform {
  backend "s3" {
    bucket         = "shared-services-terraform-state"
    key            = "state/${path.basename(path.root)}.tfstate"
    region         = "us-west-1"
    dynamodb_table = "shared-services-terraform-locks"
    encrypt        = true
  }
}