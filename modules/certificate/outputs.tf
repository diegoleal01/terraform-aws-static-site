output "certificate_arn" {
  description = "ARN of the ACM certificate generated"
  value       = aws_acm_certificate.cert.arn
}

output "validation_records" {
  description = "CNAME records to add to the DNS provider to complete domain validation"
  value       = aws_acm_certificate.cert.domain_validation_options
}