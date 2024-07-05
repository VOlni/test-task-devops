# Create a Route 53 hosted zone for your domain
resource "aws_route53_zone" "my_domain_zone" {
    name = var.domain_name
}

resource "aws_route53_record" "eip_dns_record" {
    zone_id = aws_route53_zone.my_domain_zone.zone_id
    name    = "qa.${var.domain_name}"
    type    = "A"
    ttl     = "300" # TTL in seconds

    records = [
        aws_eip.webserver_static_ip.public_ip
    ]
}