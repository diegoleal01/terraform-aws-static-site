data "aws_iam_policy_document" "iam_policy_allow_get_objects_from_website_bucket" {
  statement {
    principals {
      type = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "${aws_s3_bucket.website_bucket.arn}/*"
    ]
  }
}

resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name

  tags = merge(
    var.tags,
    {
      Name = "${var.bucket_name}"
    }
  )
}

resource "aws_s3_bucket_website_configuration" "website_bucket_configuration" {
  bucket = aws_s3_bucket.website_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {                                                                                                                                                         
    key = "error.html"                                                                                                                                                       
  }

}

resource "aws_s3_bucket_public_access_block" "public_access_definition" {
  bucket = aws_s3_bucket.website_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_versioning" "website_bucket_versioning" {
  bucket = aws_s3_bucket.website_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_policy" "s3_policy_allow_get_objects_from_website_bucket" {
  bucket = aws_s3_bucket.website_bucket.id
  policy = data.aws_iam_policy_document.iam_policy_allow_get_objects_from_website_bucket.json
}