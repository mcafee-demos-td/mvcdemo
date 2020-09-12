provider "aws" {
    version = "~> 2.0"
    region  = "us-east-1"
}

data "aws_caller_identity" "current" {}

resource "aws_kms_key" "KMSKey1" {
    deletion_window_in_days = 10
    is_enabled        = true
    enable_key_rotation   = true
    tags = {
      "key" = "Name"
      "value" = "shift-left"
    }
}

resource "aws_kms_external_key" "ExternalKey" {
  enabled = true
}

resource "aws_cloudtrail" "CloudTrailforCMK" {
  name                          = "tf-trail-foobar"
  s3_bucket_name                = "someBucket"
  s3_key_prefix                 = "prefix"
  include_global_service_events = false
  kms_key_id                    = ${aws_kms_key.KMSKey1.arn}
}