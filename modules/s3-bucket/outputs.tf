output "bucket_site_arn" {
  description = "ARN of the S3 bucket hosting the static website"
  value       = aws_s3_bucket.website_bucket.arn
}

output "bucket_site_id" {
  description = "ID (name) of the S3 bucket hosting the static website"
  value       = aws_s3_bucket.website_bucket.id
}

output "regional_domain_name" {
  description = "Regional domain name of the S3 bucket"
  value       = aws_s3_bucket.website_bucket.bucket_regional_domain_name
}
