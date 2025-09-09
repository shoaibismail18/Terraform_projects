provider "aws" {
    region = "us-east-1" #set your desired region here
  
}

resource "aws_instance" "example" {
    ami           = "ami-00ca32bbc84273381" #Amazon Linux 2 AMI (HVM), SSD Volume Type
    instance_type = "t2.micro" #Free tier eligible instance type
    subnet_id = "subnet-0ed8d3403d1e0b963" #replace with your subnet id
    key_name = "test.pem" #replace with your key pair name
  
}