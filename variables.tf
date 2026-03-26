# Global variables
variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region where resources will be provisioned"
}

variable "cli_profile" {
  type        = string
  description = "AWS CLI profile to use for authentication"
}

# S3 variables
variable "bucket_name" {
  type        = string
  description = "Globally unique name for the S3 bucket that will host the static website"
}

# ACM variables
variable "domain_name" {
  type = string
  description = "The primary domain name for the ACM certificate"
}