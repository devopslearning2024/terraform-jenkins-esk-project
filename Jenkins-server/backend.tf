terraform {
  backend "s3" {
    bucket = "firstbucketproject1"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}
