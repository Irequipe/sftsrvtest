provider "aws" {
  region = "us-east-1"
}

## Security Group##
resource "aws_security_group" "security_group_instance" {
  vpc_id = "vpc-0f7fb109ce902d9bf"
  name   = "security_group_instance"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "security_group_instance"
  }
}

resource "aws_instance" "web_instance1" {
  ami           = "ami-0533f2ba8a1995cf9"
  instance_type = "t2.micro"
  key_name      = "terraform-ec2"

  subnet_id                   = "subnet-09e85f18787181f1c"
  vpc_security_group_ids      = [aws_security_group.security_group_instance.id]
  associate_public_ip_address = true


  tags = {
    "Name" : "VM1"
  }

  
}

resource "aws_instance" "web_instance2" {
  ami           = "ami-0533f2ba8a1995cf9"
  instance_type = "t2.micro"
  key_name      = "terraform-ec2"

  subnet_id                   = "subnet-09e85f18787181f1c"
  vpc_security_group_ids      = [aws_security_group.security_group_instance.id]
  associate_public_ip_address = true


  tags = {
    "Name" : "VM2"
  }

  
}



