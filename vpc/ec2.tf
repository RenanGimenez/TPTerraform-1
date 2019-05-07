### Variables
variable front_instance_number {
  default = "1"
}

variable front_ami {
  default = "ami-0d77397e" # Ubuntu 16.04
}

variable ami_name {
  default = "AMI Terraform" # Ubuntu 16.04
}
variable "ami_key_pair_name" {
  default = "KeyTerraform"
}

variable front_instance_type {
  default = "t2.micro"
}

variable public_key {
  default = "AAAAB3NzaC1yc2EAAAADAQABAAABAQCQ8UsXMQoKl/zBtQ6d+25p6imtKcjQwXlHl5PSR9TiGkMF3uMr/7xc/PpjfuQ+BKee2ml+c6oFssdRGOMqU8BLf2pac1YVHi05ltP0WCzRgcEX1vhKp2b6QBQ3BXS47p9/KMvws7PjG6VK9JqUfImaviDq05phsJ32zA1DsfFRE7ZsWjE0gaSEql+zEJRRjPrdSr8b9bR8dP2kpOxTr+ISkbJm5bCAhhs5fBIqaEhgiSxOKYU5I+tjqR4U9bQ7WkKK8dQjr7Z4ornRFqnH/RPCpq4460yosX7j+O8lsD4/UGKftJcda+Gim+K+/EYtX3OF1WsX/DF9BqNuBq0lg2M1"
}

resource "aws_instance" "test-ec2-instance" {
  ami = "${var.front_ami}"
  instance_type = "t2.micro"
  key_name = "KeyTerraform"
tags {
    Name = "${var.ami_name}"
  }
subnet_id = "${aws_subnet.public.id}"
}

resource "aws_security_group" "ingress-all-test" {
name = "allow_sg"
vpc_id = "${aws_vpc.main.id}"
ingress {
    cidr_blocks = [
      "176.67.91.153/32"
    ]
from_port = 22
    to_port = 22
    protocol = "tcp"
  }
}
