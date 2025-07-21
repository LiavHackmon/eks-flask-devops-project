terraform {
  backend "s3" {
    bucket         = "liav-mybucket-2025"
    key            = "eks-devops-project/terraform.tfstate"
    region         = "eu-north-1"
    encrypt        = true
  }
}

