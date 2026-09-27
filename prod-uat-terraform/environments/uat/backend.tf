terraform {
  backend "s3" {

    bucket = "company-tfstate"

    key = "uat/terraform.tfstate"

    region = "ap-south-1"
  }
}
``
