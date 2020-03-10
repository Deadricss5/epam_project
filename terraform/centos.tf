provider "aws" {

}

resource "aws_instance" "centos_master" {
  ami           = "ami-0f2b4fc905b0bd1f1"
  instance_type = "t3.micro"
  key_name = "project"
  tags = { 
      Name = "centos master"
      Owner = "Your Name"
      Project = "EPAM external course project"
  }
  vpc_security_group_ids = ["${aws_security_group.web_server_ssh.id}", "${aws_security_group.web_server_jenkins.id}"]
}

resource "aws_instance" "centos_slave" {
  ami           = "ami-0f2b4fc905b0bd1f1"
  instance_type = "t3.micro"
  key_name = "project"
  tags = { 
      Name = "centos Slave"
      Owner = "Your Name"
      Project = "EPAM external course project"
  }
  vpc_security_group_ids = ["${aws_security_group.web_server_ssh.id}", "${aws_security_group.web_server.id}"]
}


#//////////Describe security Groups
resource "aws_security_group" "web_server" {
  name        = "Web server security group"
  description = "Allow html traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "web_server_ssh" {
  name        = "Web server security group for ssh connection"
  description = "Allow ssh traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "web_server_jenkins" {
  name        = "Web server security group for web-interface connection"
  description = "Allow jenkins web-interface"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}


