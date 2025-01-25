terraform {
  backend "s3" {
    bucket = "hyndavitest1234567"
    region = "ap-south-1"
    key    = "hyndu/terraform.tfstate"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
