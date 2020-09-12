provider "aws"{
  version   = "~> 2.0"
  region  = "us-east-1"
  alias   = "aws-s3"
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "bucket" {
  bucket  = "my-tf-test-bucket"
  acl     = "private"

  logging {
    target_bucket = "logBucket"
    target_prefix = "log/"
  }
  lifecycle_rule {
    id      = "tmp"
    prefix  = "tmp/"
    enabled = true

    expiration {
      date = "2016-01-12"
    }
  }
  versioning {
    enabled   = true
    mfa_delete  = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }

  tags = {
    "key"       = "Name"
    "value"     = "shift-left"
  }
}

resource "aws_s3_bucket_public_access_block" "bucketACL" {
  bucket = "${aws_s3_bucket.bucket.id}"
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}