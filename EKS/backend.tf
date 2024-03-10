terraform {
  backend "s3" {
    bucket = "firstbucketproject1"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}
