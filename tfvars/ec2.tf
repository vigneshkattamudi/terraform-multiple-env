resource "aws_instance" "ec2_instance" {
  count = length(var.instances) # count based loop is a list always
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = ""
  vpc_security_group_ids = [aws_security_group.all-allow.id]

  tags = {
    Name = var.instances[count.index]
    environment = ""
  }
}

resource "aws_security_group" "all-allow" {
  name        = "all-allow"
  description = "Allow all traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "allow-all"
  }
}
