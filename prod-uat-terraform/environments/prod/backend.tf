terraform {
  backend "s3" {

    bucket = "company-tfstate"

    key = "prod/terraform.tfstate"

    region = "ap-south-1"
  }
}
