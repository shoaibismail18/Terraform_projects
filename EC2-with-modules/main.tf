provider "aws" {
  region = "us-east-1"
  
}
module "ec2-instance" {
  source        = "./modules/ec2-instance"
  ami_id        = "" #Replace with your AMI ID
  instance_type = ""# Replace with your instance type
  subnet_id_value = "" # Replace with your subnet ID
  key_name = "" # Replace with your key pair name
  tags          = ""# Replace with your tags
  
}