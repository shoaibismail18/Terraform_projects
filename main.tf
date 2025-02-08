#########################################
# CREATE AN S3 BUCKET AND DYNAMODB TABLE TO USE AS A TERRAFORM BACKEND
#########################################

# Requires Terraform version 0.12 or higher
terraform {
  required_version = ">= 0.12"
}

# --------------------------------------------------------------------------
# CONFIGURE AWS CONNECTION
# --------------------------------------------------------------------------

provider "aws" {
  region = "ap-southeast-2" # Ensure a valid region is set
}

# -------------------------------------------------------------------------
# GET ACCOUNT ID
# -------------------------------------------------------------------------
data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}

# -------------------------------------------------------------------------
# CREATE THE S3 BUCKET
# -------------------------------------------------------------------------
resource "aws_s3_bucket" "terraform_state" {
  bucket = "${local.account_id}-terraform-states"
}

# Enable versioning
resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_encryption" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# --------------------------------------------------------------------------
# CREATE THE DYNAMODB TABLE
# --------------------------------------------------------------------------
resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

