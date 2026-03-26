output "certificate_arn" {
  value = aws_acm_certificate.cert.arn
  description = "ARN of the certificate generated"
}

output "validation_records" {
  value = aws_acm_certificate.cert.domain_validation_options
  description = "CNAME records to add in DNS service"
}