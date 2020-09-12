provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

data "aws_caller_identity" "current" {}

resource "aws_cloudtrail" "CloudTrail_1" {
  name                          = "CloudTrail_1_trail"
  s3_bucket_name                = "${aws_s3_bucket.CloudTrail_1_S3.id}"
  s3_key_prefix                 = "prefix"
  include_global_service_events = false

  cloud_watch_logs_group_arn    = "arn:aws:logs:us-west-2:295207888133:log-group:CloudTrail/DefaultLogGroup:*"
  kms_key_id                    = "arn:aws:kms:sa-east-1:295207888133:key/18a1f4b4-789c-43b6-b7a1-31920c828047"
  is_multi_region_trail         = true
  enable_log_file_validation    = true
  tags = {
    "key"       = "Name"
    "value"     = "shift-left"
  }
  enable_logging                = false         
}

resource "aws_s3_bucket" "CloudTrail_1_S3" {
  bucket        = "CloudTrail_1_S3"
  force_destroy = true
  acl = "private"
  versioning {
    enable        = true
    mfa_delete    = true
  }
  logging {
    target_bucket = "logBucket"
    target_prefix = "log/"
  }

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::tf-test-trail"
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::tf-test-trail/prefix/AWSLogs/${data.aws_caller_identity.current.account_id}/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}
POLICY
}

resource "aws_s3_bucket_public_access_block" "bucketACL" {
  bucket = "${aws_s3_bucket.CloudTrail_1_S3.id}"
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}