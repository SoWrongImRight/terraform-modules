resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "this" {
    bucket  = "${var.prefix_name}-${random_id.suffix.hex}"
    force_destroy = var.force_destroy
    tags = var.tags
}

resource "aws_s3_bucket_versioning" "this" {
    bucket = aws_s3_bucket.this.id
    
    versioning_configuration {
      status = var.versioning ? "Enabled" : "Suspended"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  count = var.enable_encryption ? 1: 0
  bucket = aws_s3_bucket.this.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
      kms_master_key_id = var.kms_key_id
    }
  }
}