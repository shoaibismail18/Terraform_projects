provider "aws" {
  region = "us-east-1"
  
}
resource "aws_instance" "Shoaib" {
  ami           = "ami-00ca32bbc84273381"
  instance_type = "t2.micro"
  subnet_id = "subnet-0ed8d3403d1e0b963"

  tags = {
    Name = "Shoaib-Instance"
  }
  
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "shoaib-terraform-backend-bucket"
  
}
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  
}