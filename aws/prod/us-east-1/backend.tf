terraform {
  backend "s3" {
    bucket         = "prod-terraform-state"
    key            = "state/${path.basename(path.root)}.tfstate"
    region         = "us-east-1"
    dynamodb_table = "prod-terraform-locks"
    encrypt        = true
  }
}