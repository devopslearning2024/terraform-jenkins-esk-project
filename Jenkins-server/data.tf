data "aws_ami" "example" {
  #   executable_users = ["self"]
  most_recent = true
  #   name_regex       = "^myami-\\d{3}"
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.20240223.0-x86_64-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# State can be either: available, information, impaired, or unavailable
data "aws_availability_zones" "azs" {

}
