provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

data "aws_caller_identity" "current" {}

resource "aws_instance" "EC2Instance" {
  ami           	= "ami-0d2692b6acea72ee6"
  instance_type 	= "t2.micro"
  security_groups  	= [	"${aws_security_group.SGUnusedSecurityGroups.id}"
  						"${aws_security_group.SGUnrestrictedOutboundAccess.id}",
  						"${aws_security_group.SGEC2SecurityGroupPortConfiguration.id}",
  						"${aws_security_group.SGUnrestrictedAccesstoNonHTTP.id}",
  						"${aws_security_group.SGUnrestrictedCIFSAccess.id}",
  						"${aws_security_group.SGUnrestrictedDNSAccess.id}",
  						"${aws_security_group.SGUnrestrictedFTPAccess.id}",
  						"${aws_security_group.SGUnrestrictedMongoDBAccess.id}",
  						"${aws_security_group.SGUnrestrictedMSSQLAccess.id}",
  						"${aws_security_group.SGUnrestrictedMSSQLDatabaseAccessUDP.id}",
  						"${aws_security_group.SGUnrestrictedMySQLAccess.id}",
  						"${aws_security_group.SGUnrestrictedNetBIOSAccess.id}",
  						"${aws_security_group.SGUnrestrictedOracleDatabaseAccess.id}",
  						"${aws_security_group.SGUnrestrictedPostgreSQLAccess.id}",
  						"${aws_security_group.SGUnrestrictedRPCAccess.id}",
  						"${aws_security_group.SGUnrestrictedSMTPAccess.id}",
  						"${aws_security_group.SGUnrestrictedSSHAccess.id}",
  						"${aws_security_group.SGUnrestrictedTelnetAccess.id}",
  						"${aws_security_group.SGUnrestrictedVNCListenerAccess.id}",
  						"${aws_security_group.SGUnrestrictedVNCServerAcces.id}",
  						"${aws_security_group.SGUnrestrictedRemoteDesktopAccess.id}",
  						"${aws_security_group.SGUnrestrictedICMPAccess.id}",
  						"${aws_security_group.SGUnrestrictedInboundAccessOnUncommonPorts.id}"]
}

resource "aws_security_group" "SGUnusedSecurityGroups" {
  name        = "SGUnusedSecurityGroups"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/10"]
  }
  tags = {
    "key"       = "Name"
    "value"     = "shift-left"
  }
}
resource "aws_security_group" "SGUnrestrictedOutboundAccess" {
  name        = "SGUnrestrictedOutboundAccess"
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "tcp"
    cidr_blocks     = ["160.0.0.0/10"]
  }
}
resource "aws_security_group" "SGEC2SecurityGroupPortConfiguration" {
  name        = "SGEC2SecurityGroupPortConfiguration"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/10"]
  }
}
resource "aws_security_group" "SGUnrestrictedAccesstoNonHTTP" {
  name        = "SGUnrestrictedAccesstoNonHTTP"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/10"]
  }
}
resource "aws_security_group" "SGUnrestrictedCIFSAccess" {
  name        = "SGUnrestrictedCIFSAccess"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/10"]
  }
}
resource "aws_security_group" "SGUnrestrictedDNSAccess" {
  name        = "SGUnrestrictedDNSAccess"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/10"]
  }
}
resource "aws_security_group" "SGUnrestrictedFTPAccess" {
  name        = "SGUnrestrictedFTPAccess"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/10"]
  }
}
resource "aws_security_group" "SGUnrestrictedMongoDBAccess" {
  name        = "SGUnrestrictedMongoDBAccess"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/10"]
  }
}
resource "aws_security_group" "SGUnrestrictedMSSQLAccess" {
  name        = "SGUnrestrictedMSSQLAccess"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/10"]
  }
}
resource "aws_security_group" "SGUnrestrictedMSSQLDatabaseAccessUDP" {
  name        = "SGUnrestrictedMSSQLDatabaseAccessUDP"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/10"]
  }
}
resource "aws_security_group" "SGUnrestrictedMySQLAccess" {
  name        = "SGUnrestrictedMySQLAccess"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/10"]
  }
}
resource "aws_security_group" "SGUnrestrictedNetBIOSAccess" {
  name        = "SGUnrestrictedNetBIOSAccess"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/10"]
  }
}
resource "aws_security_group" "SGUnrestrictedOracleDatabaseAccess" {
  name        = "SGUnrestrictedOracleDatabaseAccess"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/10"]
  }
}
resource "aws_security_group" "SGUnrestrictedPostgreSQLAccess" {
  name        = "SGUnrestrictedPostgreSQLAccess"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/10"]
  }
}
resource "aws_security_group" "SGUnrestrictedRPCAccess" {
  name        = "SGUnrestrictedRPCAccess"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/10"]
  }
}
resource "aws_security_group" "SGUnrestrictedSMTPAccess"" {
  name        = "SGUnrestrictedSMTPAccess""
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/10"]
  }
}
resource "aws_security_group" "SGUnrestrictedSSHAccess" {
  name        = "SGUnrestrictedSSHAccess"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/10"]
  }
}
resource "aws_security_group" "SGUnrestrictedTelnetAccess" {
  name        = "SGUnrestrictedTelnetAccess"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/10"]
  }
}
resource "aws_security_group" "SGUnrestrictedVNCListenerAccess" {
  name        = "SGUnrestrictedVNCListenerAccess"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/10"]
  }
}
resource "aws_security_group" "SGUnrestrictedVNCServerAcces" {
  name        = "SGUnrestrictedVNCServerAcces"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/10"]
  }
}
resource "aws_security_group" "SGUnrestrictedRemoteDesktopAccess" {
  name        = "SGUnrestrictedRemoteDesktopAccess"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/10"]
  }
}
resource "aws_security_group" "SGUnrestrictedICMPAccess" {
  name        = "SGUnrestrictedICMPAccess"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "icmp"
    cidr_blocks = ["140.20.30.10/10"]
  }
}
resource "aws_security_group" "SGUnrestrictedInboundAccessOnUncommonPorts" {
  name        = "SGUnrestrictedInboundAccessOnUncommonPorts"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/10"]
  }
}