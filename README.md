# Terraform Modules

A library of reusable, composable Terraform modules for provisioning AWS infrastructure. Each module is self-contained, follows a consistent `main` / `variables` / `outputs` layout, and is designed to be sourced into higher-level environment configurations.

---

## 📦 Modules

| Module | Description |
|--------|-------------|
| [`acm`](modules/acm) | ACM TLS/SSL certificate provisioning and validation |
| [`alb`](modules/alb) | Application Load Balancer with listeners and target groups |
| [`asg`](modules/asg) | EC2 Auto Scaling Group |
| [`auto_scaling_policy`](modules/auto_scaling_policy) | Scaling policies for an Auto Scaling Group |
| [`aws_fis`](modules/aws_fis) | AWS Fault Injection Simulator experiments for resilience/chaos testing — includes `asg_test_cpu` (CPU stress) and `ec2_termination_by_tag` |
| [`cloudfront`](modules/cloudfront) | CloudFront distribution |
| [`ecr`](modules/ecr) | Elastic Container Registry repository |
| [`http_lambda_gateway`](modules/http_lambda_gateway) | HTTP API Gateway fronting a Lambda function |
| [`iam`](modules/iam) | Reusable IAM roles — generic `roles/role` (with optional instance profile) and `roles/fis_role` for FIS experiments |
| [`kms_key`](modules/kms_key) | KMS encryption key |
| [`lambda`](modules/lambda) | Lambda function from a local ZIP — see its [README](modules/lambda/README.md) for full inputs/outputs |
| [`lambda_api_route`](modules/lambda_api_route) | API Gateway route integration for a Lambda function |
| [`launch_template`](modules/launch_template) | EC2 launch template |
| [`route53_records`](modules/route53_records) | Route 53 DNS records |
| [`s3`](modules/s3) | S3 bucket with versioning and server-side encryption |
| [`secrets_manager`](modules/secrets_manager) | Secrets Manager secret |
| [`security_group`](modules/security_group) | EC2 security group with configurable rules |
| [`vpc`](modules/vpc) | VPC with public/private subnets, internet gateway, and route tables |

---

## 🚀 Usage

Reference a module by its path using a Git source or a relative path from your configuration:

```hcl
module "vpc" {
  source = "git::https://github.com/SoWrongImRight/terraform-modules.git//modules/vpc"

  # module inputs...
}
```

Or, when vendored locally alongside your environment code:

```hcl
module "app_bucket" {
  source = "../terraform-modules/modules/s3"

  # module inputs...
}
```

Each module exposes its configurable inputs in `variables.tf` and its return values in `outputs.tf`. The [`lambda`](modules/lambda/README.md) module includes a fully documented example.

---

## ✅ Requirements

- **Terraform** >= 1.3
- **Providers**: `hashicorp/aws` (all modules); `hashicorp/random` (used by `s3` for bucket-name suffixing)
- AWS credentials configured in the calling environment (via profile, environment variables, or an assumed role)

---

## 🗂 Conventions

- Every module follows a `main.tf` / `variables.tf` / `outputs.tf` structure.
- Modules are intentionally unopinionated about backend and provider configuration — those belong in the calling root module.
- State files, `.tfvars`, and lock files are git-ignored; modules carry no committed state.
