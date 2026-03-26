module "s3" {
  source       = "./modules/s3-bucket"
  tags         = local.tags
  bucket_name  = var.bucket_name
}

module "certificate" {
  source       = "./modules/certificate"
  tags         = local.tags
  domain_name  = var.domain_name
}
