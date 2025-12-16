resource "aws_instance" "ec2_instance" {
  count = length(var.instances) # count based loop is a list always
  ami                    = var.ami_id
  instance_type          = lookup(var.instance_type, terraform.workspace, "t3.big") #lookup(map, key, default)
  vpc_security_group_ids = [aws_security_group.all-allow.id]

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project}-${var.instances[count.index]}-${terraform.workspace}"
      Component = var.instances[count.index]
      Environment = terraform.workspace #terraform.workspace is special variable
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
    Name = "${var.project}-${var.sg_name}-${terraform.workspace}"
    Environment = terraform.workspace
    }
  )
}

#Usage of terraform.workspace to get current workspace name
# terraform workspace <options>