provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

data "aws_caller_identity" "current" {}

resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = "${aws_vpc.my_vpc.id}"
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_instance" "EC2Instance" {
  ami                  = "ami-0d2692b6acea72ee6"
  instance_type        = "t2.micro"
  subnet_id            = "${aws_subnet.my_subnet.id}"
  security_groups      = ["${aws_security_group.securityGroup.id}"]
  iam_instance_profile = "arn:aws:iam::295207888133:instance-profile/Ec2testrole"

  tags = {
    "key"       = "Name"
    "value"     = "shift-left"
  }
}

resource "aws_security_group" "securityGroup" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = "${aws_vpc.my_vpc.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["172.16.10.0/24"]
  }
}
