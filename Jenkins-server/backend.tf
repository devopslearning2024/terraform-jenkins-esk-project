
#S3 bucket module
# module "s3_bucket" {
#   source = "terraform-aws-modules/s3-bucket/aws"

#   bucket = "firstbucketproject1"
#   acl    = "private"

#   control_object_ownership = true
#   object_ownership         = "ObjectWriter"

#   versioning = {
#     enabled = true
#   }
# }

# resource "aws_s3_bucket" "s3_bucket" {
#   bucket = "firstbucketproject1st"

#   tags = {
#     Name = "My bucket"
#   }
# }

# terraform {
#   backend "s3" {
#     bucket = "tryings3bucketmodule"
#     # key    = "jenkins/terraform.tfstate"
#     region = "us-east-1"
#   }
# }


