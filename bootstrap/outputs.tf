output "state_bucket_name" {
  description = "Name of the remote tfstate bucket"
  value       = aws_s3_bucket.terraform_state.id
}

output "lock_table_name" {
  description = "Name of the DynamoDB table to store Terraform locks"
  value       = aws_dynamodb_table.terraform_locks.id
}

output "state_bucket_arn" {
  description = "ARN of the remote tfstate bucket"
  value       = aws_s3_bucket.terraform_state.arn
}