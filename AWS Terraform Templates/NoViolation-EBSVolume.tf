provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

data "aws_caller_identity" "current" {}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-west-2a"
  size              = 40
  
  encrypted			= true

  tags = {
    "key"       = "Name"
    "value"     = "shift-left"
  }
}

resource "aws_instance" "EC2instance" {
  ami               = "ami-21f78e11"
  availability_zone = "us-west-2a"
  instance_type     = "t1.micro"
}

resource "aws_volume_attachment" "attachment" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.example.id}"
  instance_id = "${aws_instance.EC2instance.id}"
}