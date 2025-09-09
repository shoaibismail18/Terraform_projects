provider "aws" {
    region = "us-east-1" #set your desired region here
  
}

resource "aws_instance" "example" {
    ami           = "ami-0c55b159cbfafe1f0" #Amazon Linux 2 AMI (HVM), SSD Volume Type
    instance_type = "t2.micro" #Free tier eligible instance type
  
}