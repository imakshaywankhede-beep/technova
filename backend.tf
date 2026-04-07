terraform {
  backend "s3" {
    bucket         = "mybucket7990021"
    key            = "infra/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
  }
}
