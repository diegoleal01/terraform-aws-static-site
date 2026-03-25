output "bucket_site_arn" {
    description = "ARN of the S3 bucket hosting the static website"
    value = aws_s3_bucket.website_bucket.arn
}