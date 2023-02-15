terraform {
  backend "s3"{
    bucket = "remotebackend-with-dynamodb"
    key = "global/backend/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "remote-statelocking"
    encrypt = true
  }
}

provider "aws" {
  region = "ap-south-1"
}
