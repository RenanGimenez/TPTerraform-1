terraform {
  backend "s3" {
    bucket = "bucket070520191430terraform"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}