provider "aws" {
  region = "${var.region}"
}

# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["${var.ami_name_value}"]
#   }

  # filter {
  #   name   = "virtualization-type"
  #   values = ["${var.ami_virtualization_type}"]
  # }

  # filter {
  #   name = "owner-alias"

  #   values = [
  #     "amazon",
  #   ]
  # }
# }

# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#   }

#   owners = ["099720109477"]
# }

/*
// Use Security Group module to create security group
module "security_group" {
  source = "git::https://github.com/Patelvijaykumar/terraform-aws-security-group"
  vpc_id = "${var.vpc_id}"
}
*/

resource "aws_security_group" "allow_all" {
  count       = "${var.iscreate == "" ? 1 : 0}"
  name        = "instance_sg"
  description = "Allow all inbound traffic for security group"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = ["pl-12c4e678"]
  }
}

resource "aws_instance" "web" {
  ami                    = "ami-04b70fa74e45c3917"
  instance_type          = "${var.instance_type}"
  key_name               = "${var.keyname}"
  vpc_security_group_ids = var.sg_id

  tags = {
    Name = "${var.tag}"
  }
}

resource "aws_s3_bucket" "name-4141" {
  bucket = "name-4141"
  
}