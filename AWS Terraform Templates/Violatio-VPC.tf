provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

data "aws_caller_identity" "current" {}

resource "aws_vpc" "VPC" {
  cidr_block      = "172.31.0.0/16"
  enable_dns_support  = true
  tags = {
    "key"       = "Name"
    "value"     = "shift-left"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = "${aws_vpc.VPC.id}"
  cidr_block = "172.31.0.0/20"
}

resource "aws_subnet" "subnet2" {
  vpc_id     = "${aws_vpc.VPC.id}"
  cidr_block = "172.31.0.0/20"
}

resource "aws_subnet" "subnet3" {
  vpc_id     = "${aws_vpc.VPC.id}"
  cidr_block = "172.31.0.0/20"
}

resource "aws_subnet" "subnet4" {
  vpc_id     = "${aws_vpc.VPC.id}"
  cidr_block = "172.31.0.0/20"
}

resource "aws_subnet" "subnet5" {
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

resource "aws_security_group" "SG2" {
  name        = "SG2"
  vpc_id      = "${aws_vpc.VPC.id}"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "SG3" {
  name        = "SG3"
  vpc_id      = "${aws_vpc.VPC.id}"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "SG4" {
  name        = "SG4"
  vpc_id      = "${aws_vpc.VPC.id}"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "SG5" {
  name        = "SG5"
  vpc_id      = "${aws_vpc.VPC.id}"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_vpn_gateway" "VPNGateway" {
  vpc_id = "${aws_vpc.VPC.id}"
}