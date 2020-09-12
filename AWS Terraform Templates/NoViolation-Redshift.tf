provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

data "aws_caller_identity" "current" {}

resource "aws_redshift_cluster" "Redshift" {
  cluster_identifier  = "Redshift"
  database_name       = "someDBname"
  master_username     = "user"
  master_password     = "password"
  node_type           = "dc1.large"
  cluster_type        = "single-node"
  
  publicly_accessible = false
  encrypted       = true
  tags = {
    "key"       = "Name"
    "value"     = "shift-left"
  }
}

resource "aws_kms_external_key" "ExternalKey" {
  enabled = true
}

resource "aws_redshift_cluster" "Redshift2" {
  cluster_identifier  = "Redshift2"
  database_name       = "someDBname"
  master_username     = "user"
  master_password     = "password"
  node_type           = "dc1.large"
  cluster_type        = "single-node"

  encrypted           = true
  kms_key_id          = "${aws_kms_external_key.ExternalKey.id}"
}