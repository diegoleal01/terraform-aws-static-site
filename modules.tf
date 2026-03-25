module "s3" {
  source = "./modules/s3-bucket"
  tags = local.tags
  project_name = var.project_name
  bucket_name = var.bucket_name
}