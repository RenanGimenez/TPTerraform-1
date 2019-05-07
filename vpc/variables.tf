### Variables
variable "region" {
    type = "string"
  default = "eu-west-1"
}

variable "azs" {
  default = {
    "eu-west-1" = ["eu-west-1a"]
  }
}

variable "cidr_block" {
  default = "172.23.0.0/16"
}

variable "project_name" {
    default = "VPCTerraform"
}