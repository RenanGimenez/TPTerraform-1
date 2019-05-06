### Variables
variable "region" {
    type = "string"
  default = "us-east-1"
}

variable "cidr_block" {
  default = "172.23.0.0/16"
}

variable "project_name" {
    default = "VPCTerraform"
}