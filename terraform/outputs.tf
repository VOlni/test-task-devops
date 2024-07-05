output "webserver_instance_id" {
  description = "Webserver instance ID"
  value       = aws_instance.webserver.id
}

output "webserver_sg_id" {
  description = "Webserver security group ID"
  value       = aws_security_group.webserver_sg.id
}

output "ec2_global_ips" {
  description = "Public IP of webserver"
  value       = aws_instance.webserver.public_ip
}

output "elastic_ip" {
  description = "Static IP of webserver"
  value       = aws_eip.webserver_static_ip.public_ip
}

output "dns_name" {
  description = "DNS name"
  value = aws_route53_record.eip_dns_record.name
}

output "dns_name_server" {
  description = "DNS record"
  value = aws_route53_record.eip_dns_record.records
}