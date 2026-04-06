# Global variables
variable "tags" {
  description = "A map of tags to apply to AWS resources"
  type        = map(string)
}

# ACM variables
variable "domain_name" {
  description = "The primary domain name for the ACM certificate"
  type        = string
}
