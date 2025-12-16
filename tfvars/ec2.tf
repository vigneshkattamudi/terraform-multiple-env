resource "aws_instance" "ec2_instance" {
  count = length(var.instances) # count based loop is a list always
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.all-allow.id]

  tags = merge(var.common_tags,
    {
    Name = "${var.project}-${var.instances[count.index]}-${var.environiment}"
    Environment = var.environiment
  }
  )
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


  tags = merge(var.common_tags,
    {
    Name = "${var.project}-${var.sg_name}-${var.environiment}"
    Environment = var.environiment
    }
  )
}
