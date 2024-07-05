# type field is optional

variable "aws_profile" {
  description = "AWS Profile Creds"
  type        = string
  default     = "terraform"
}

variable "region" {
  description = "Select region"
  type        = string
  default     = "eu-central-1"
}

variable "instance_type" {
  description = "Type of the AWS instance"
  type        = string
  default     = "t2.micro"
}

variable "ssh_keyname" {
  description = "AWS SSH keypair name"
  type        = string
  default     = "your-ssh-key"
}

variable "allowed_ports" {
  description = "List of Ports to open for server"
  type        = list(any)
  default     = ["80", "8080", "443", "3000"]
}

variable "allowed_cidr_block" {
  description = "List of IPs to allow access for server"
  type        = list(any)
  default     = ["0.0.0.0/0"]
}

variable "enable_detailed_monitoring" {
  description = "Allow monitoring for server"
  type        = bool
  default     = true
}

variable "common_tags" {
  description = "Common Tags to apply to all resources"
  type        = map(any)
  default = {
    Owner       = "Owner"
    CreatedBy   = "Terraform"
    Project     = "Test task"
    Environment = "Destroyable"
  }
}

# DNS Setup
variable "domain_name" {
  description = "The domain name to use for Route 53 record"
  type        = string
  default     = "your-domain.com"
}