# Global variables
variable "aws_region" {
  description = "AWS region where resources will be provisioned"
  type        = string
  default     = "us-east-1"
}

# S3 variables
variable "bucket_name" {
  description = "Globally unique name for the S3 bucket that will host the static website"
  type        = string
}

# ACM / CloudFront variables
variable "domain_name" {
  description = "The primary domain name for the ACM certificate and CloudFront distribution"
  type        = string
}

variable "enable_custom_domain" {
  description = "Whether to attach the custom domain and ACM certificate to the CloudFront distribution. Set to false while DNS validation is pending at the external DNS provider."
  type        = bool
  default     = false
}
