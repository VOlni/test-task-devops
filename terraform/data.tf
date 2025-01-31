data "aws_ami" "latest_ubuntu" {
  owners      = ["099720109477"] # Owner amazon
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}