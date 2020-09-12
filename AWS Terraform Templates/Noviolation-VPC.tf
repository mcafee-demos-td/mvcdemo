provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

data "aws_caller_identity" "current" {}

resource "aws_vpc" "VPC" {
  cidr_block      = "172.31.0.0/16"
  enable_dns_support  = false
  tags = {
    "key"       = "Name"
    "value"     = "shift-left"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = "${aws_vpc.VPC.id}"
  cidr_block = "172.31.0.0/20"
}

resource "aws_security_group" "SG1" {
  name        = "SG1"
  vpc_id      = "${aws_vpc.VPC.id}"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_flow_log" "example" {
  log_destination      = "logBucket"
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = "${aws_vpc.VPC.id}"
}

resource "aws_nat_gateway" "NATGateway" {
  allocation_id = "someEIPid"
  subnet_id     = "${aws_subnet.subnet1.id}"
}