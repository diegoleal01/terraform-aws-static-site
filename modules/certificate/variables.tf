# Global variables
variable "tags" {
  type        = map(string)
  description = "A map of tags to apply to AWS resources"
}

# ACM variables
variable "domain_name" {
  type = string
  description = "The primary domain name for the ACM certificate"
}