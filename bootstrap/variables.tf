variable "account_id" {
  description = "AWS Account ID"
  type        = number
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "lock_table_name" {
  description = "Name of the DynamoDB table to store Terraform locks"
  type        = string
  default     = "terraform-locks"
}