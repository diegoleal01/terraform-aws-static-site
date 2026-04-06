# Global variables
variable "tags" {
  description = "A map of tags to apply to AWS resources"
  type        = map(string)
}

variable "domain_name" {
  description = "The primary domain name for the CloudFront distribution alias"
  type        = string
}

variable "enable_custom_domain" {
  description = "Whether to attach the custom domain and ACM certificate to the distribution. Set to false while DNS validation is pending."
  type        = bool
  default     = false
}

# S3 variables
variable "bucket_arn" {
  description = "ARN of the S3 bucket hosting the static website"
  type        = string
}

variable "bucket_id" {
  description = "ID (name) of the S3 bucket hosting the static website"
  type        = string
}

variable "bucket_regional_domain_name" {
  description = "Regional domain name of the S3 bucket, used as the CloudFront origin"
  type        = string
}

# ACM variables
variable "acm_certificate_arn" {
  description = "ARN of the ACM certificate for the custom domain (must be in us-east-1). Required when enable_custom_domain is true."
  type        = string
  default     = null
  nullable    = true
}
