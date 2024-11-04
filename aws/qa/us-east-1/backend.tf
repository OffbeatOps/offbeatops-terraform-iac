terraform {
  backend "s3" {
    bucket         = "qa-terraform-state"
    key            = "state/${path.basename(path.root)}.tfstate"
    region         = "us-east-1"
    dynamodb_table = "qa-terraform-locks"
    encrypt        = true
  }
}