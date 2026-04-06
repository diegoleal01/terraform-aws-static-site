module "s3" {
  source      = "./modules/s3-bucket"
  tags        = local.tags
  bucket_name = var.bucket_name
}

module "certificate" {
  source      = "./modules/certificate"
  tags        = local.tags
  domain_name = var.domain_name
}

module "cloud_front" {
  source = "./modules/cloud-front"

  tags                 = local.tags
  domain_name          = var.domain_name
  enable_custom_domain = var.enable_custom_domain

  bucket_arn                  = module.s3.bucket_site_arn
  bucket_id                   = module.s3.bucket_site_id
  bucket_regional_domain_name = module.s3.regional_domain_name

  acm_certificate_arn = module.certificate.certificate_arn
}
