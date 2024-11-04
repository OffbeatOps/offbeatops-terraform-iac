terraform {
  backend "s3" {
    bucket         = "dev-terraform-state"
    key            = "state/${path.basename(path.root)}.tfstate"
    region         = "us-west-1"
    dynamodb_table = "dev-terraform-locks"
    encrypt        = true
  }
}