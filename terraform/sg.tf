resource "aws_security_group" "webserver_sg" {
  name        = "WebServer Security Group"
  description = "Allow inbound traffic"

  dynamic "ingress" {
    for_each = var.allowed_ports

    content {
      description = "Incoming traffic"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = var.allowed_cidr_block
    }
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    # cidr_blocks = ["*.*.*.*/32"] # My IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.common_tags, {
    Name = "${var.common_tags["Environment"]} My Server Traffic rules"
  })
}
