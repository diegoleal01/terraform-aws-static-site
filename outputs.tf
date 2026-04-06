output "cloudfront_domain_name" {
  description = "CloudFront distribution domain name. Use this URL to access the site before the custom domain is attached."
  value       = module.cloud_front.distribution_domain_name
}

output "certificate_validation_records" {
  description = "CNAME records to add to your DNS provider to complete ACM certificate validation."
  value       = module.certificate.validation_records
}
