provider "aws" {
  region = "us-east-1"
  
}
resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id = var.subnet_id_value
  associate_public_ip_address = true
  key_name = var.key_name

  tags = {
    Name = var.tags
  }
  
}