# terraform-aws-static-site

Terraform project that provisions the infrastructure for an AWS-hosted static website using S3 as origin and CloudFront as CDN, with an ACM certificate for HTTPS.

Designed for scenarios where **DNS is managed outside AWS** (e.g., Locaweb, Registro.br, Cloudflare), so certificate validation and distribution setup are split into two apply stages.

---

## What it provisions

- **S3 bucket** — private bucket that stores the website files
- **CloudFront distribution** — CDN with OAC (Origin Access Control), so only CloudFront can read the bucket
- **ACM certificate** — SSL/TLS certificate for the custom domain, with DNS validation

---

## Prerequisites

- Terraform >= 1.5
- AWS provider ~> 6.0
- `AWS_PROFILE` environment variable set to a valid AWS CLI profile
- A registered domain managed by an external DNS provider

---

## Deployment

The project uses a two-stage deployment to separate the remote state backend from the site infrastructure.

### Stage 1 — Bootstrap (run once)

Creates the S3 bucket and DynamoDB table used as Terraform remote state backend.

Create a `terraform.tfvars` file inside `bootstrap/`:

```hcl
account_id  = "your AWS account ID"
aws_region  = "aws-region"
environment = "dev"
```

Then apply:

```bash
cd bootstrap/
terraform init
terraform apply
```

After apply, fill in the `backend "s3"` block in `main.tf` with the bucket name, key, and region from the bootstrap outputs.

### Stage 2 — Site infrastructure

Create a `terraform.tfvars` file in the root directory:

```hcl
aws_region           = "aws-region"
bucket_name          = "your-unique-bucket-name"
domain_name          = "yourdomain.com"
enable_custom_domain = false
```

Then initialize and apply:

```bash
terraform init
terraform apply
```

---

## Handling DNS validation with an external provider

ACM requires DNS validation before CloudFront can use the certificate. Since the DNS is managed outside AWS, validation depends on manually adding records to your DNS provider. To avoid a failed apply while the certificate is pending, the deployment is split into two applies controlled by the `enable_custom_domain` variable.

### Apply 1 — Create infrastructure without the custom domain

With `enable_custom_domain` unset (defaults to `false`), CloudFront is created using the default `*.cloudfront.net` certificate, with no custom domain alias:

```bash
terraform apply
```

After apply, retrieve the DNS validation records:

```bash
terraform output certificate_validation_records
```

Add the CNAME records shown to your DNS provider and wait for the certificate status to change to **Issued** in the AWS Console (ACM).

### Apply 2 — Attach the custom domain

Once the certificate is issued, set in `terraform.tfvars`:

```hcl
enable_custom_domain = true
```

Then apply again:

```bash
terraform apply
```

CloudFront will be updated to use the ACM certificate and the custom domain alias.

---

## Variables

- `bucket_name` — globally unique name for the S3 bucket
- `domain_name` — primary domain name for the certificate and distribution
- `aws_region` — AWS region where resources will be provisioned (default: `us-east-1`)
- `enable_custom_domain` — attach the custom domain and ACM certificate to CloudFront (default: `false`)
