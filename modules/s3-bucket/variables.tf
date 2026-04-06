# Global variables
variable "tags" {
  description = "A map of tags to apply to AWS resources"
  type        = map(string)
}

# S3 variables
variable "bucket_name" {
  description = "Globally unique name for the S3 bucket that will host the static website"
  type        = string
}
