# Global variables
variable "tags" {
  type        = map(string)
  description = "A map of tags to apply to AWS resources"
}

# S3 variables
variable "bucket_name" {
  type        = string
  description = "Globally unique name for the S3 bucket that will host the static website"
}