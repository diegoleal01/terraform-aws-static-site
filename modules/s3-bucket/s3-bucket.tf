resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name

  tags = merge(
    var.tags,
    {
      Name = "${var.bucket_name}"
    }
  )
}

resource "aws_s3_bucket_public_access_block" "public_access_definition" {
  bucket                  = aws_s3_bucket.website_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "website_bucket_versioning" {
  bucket = aws_s3_bucket.website_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}