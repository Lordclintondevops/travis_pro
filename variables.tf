variable "region" {
  default = "us-east-1"
}

variable "tag" {
  default = "Demo-Instance"
}

# # variable "ami_name_value" {
#   default = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20240423*"
# }

# variable "ami_virtualization_type" {
#   default = "hvm"
# }

variable "instance_type" {
  default = "t2.micro"
}

variable "iscreate" {
  default = "true"
}

variable "sg_id" {
  default = "sg-0d61315e929c9b42c"
}


variable "keyname" {
  default = "EAST-KEY"
}
variable "vpc_id" {
  default = "vpc-070c3c4ddf310be5d"
}
