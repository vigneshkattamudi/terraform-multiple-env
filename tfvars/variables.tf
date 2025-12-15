variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "Roboshop Ami"
}

variable "instance_type" {
  
}

variable "ec2_tags" {
  type = map(string)
  default = {
    Name        = "Roboshop"
    description = "variables-demo"
  }
}

variable "sg_name" {
  default = "allow-all"
}

variable "sg_description" {
  default = "allowing all ports from internet"
}

variable "from_port" {
  default = 0
}

variable "to_port" {
  type    = number #always good to mention type but (optional)
  default = 0
}

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
  default = {
    Name = "allow-all"
  }
}

variable "environiment" {
 
  
}

variable "instances" {
  default = [ "mongodb" , "redis", "mysql" ]
}

variable "zone_id" {
  default = "Z0443285370E15R10QIN"
}

variable "domain_name" {
  default = "dsops84.space"
}