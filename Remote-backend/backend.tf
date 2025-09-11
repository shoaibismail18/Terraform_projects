terraform {
  backend "s3" {
    bucket = "shoaib-terraform-backend-bucket"
    key    = "shoaib/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}
