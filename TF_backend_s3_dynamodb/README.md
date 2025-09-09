
# Terraform Remote Backend Setup with AWS S3 and DynamoDB

This project sets up a **remote backend** for Terraform using **AWS S3** for state storage and **DynamoDB** for state locking. This ensures secure, version-controlled, and collaborative Terraform state management.

## 🚀 Features
- **Stores Terraform state** in an **S3 bucket**  
- **Enables state versioning** to track changes  
- **Uses DynamoDB for state locking** (prevents conflicts in team environments)  
- **Encrypts state files** for security  

## 🏗️ Infrastructure Components
1. **AWS S3 Bucket** 🪣  
   - Stores Terraform state files  
   - Versioning enabled for history tracking  
   - AES-256 encryption for security  

2. **AWS DynamoDB Table** 📊  
   - Used for Terraform state locking  
   - Prevents multiple users from making simultaneous changes  

## 🔧 Setup & Deployment

### 1️⃣ Prerequisites
- **AWS Account** with IAM permissions  
- **Terraform Installed** (`>= 0.12`)  
- **AWS CLI Configured** (`aws configure`)  

### 2️⃣ Clone the Repository
git clone https://github.com/Shoaibismail18/Terraform_projects.git
cd Terraform_projects


### 3️⃣ Initialize Terraform
terraform init

### 4️⃣ Apply the Configuration
terraform apply

Confirm with **yes** when prompted.

## 🛑 Cleanup (Destroy Resources - If you are using an AWS free tier account it is recommended to clean the resources to avoid billing)
To remove all created resources:

terraform destroy

Confirm with **yes** when prompted.

## 📂 File Structure
📦 Terraform_projects
 ┣ 📜 main.tf         # Terraform configuration for S3 & DynamoDB
 ┣ 📜 variables.tf    # (Optional) Variables file
 ┣ 📜 README.md       # Documentation

## 🔗 Useful Resources
- [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
- [AWS S3](https://aws.amazon.com/s3/)
- [AWS DynamoDB](https://aws.amazon.com/dynamodb/)

## 👨‍💻 Author
**Shoaib Ismail**  
GitHub: [@Shoaibismail18](https://github.com/Shoaibismail18)  

This **Terraform setup** follows best practices for **remote state management** in AWS. 🚀 Happy coding!
