#----------------------------
# Creating host for Test task
# 
# Resource Lifecycle && Zero Downtime
# Outputs
#
#----------------------------

provider "aws" {
  profile = var.aws_profile
  region  = var.region
}

resource "aws_eip" "webserver_static_ip" {
  instance = aws_instance.webserver.id
}

resource "aws_instance" "webserver" {
  ami                    = data.aws_ami.latest_ubuntu.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.webserver_sg.id]
  key_name               = var.ssh_keyname
  monitoring             = var.enable_detailed_monitoring
  user_data              = local.user_data
  # Not beautiful but TF didn't take script from locals

  tags = merge(var.common_tags, {
    Name = "${var.common_tags["Environment"]} My Server"
  })

  lifecycle {
    create_before_destroy = true
  }
}