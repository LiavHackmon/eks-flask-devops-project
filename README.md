# AWS Infrastructure Provisioning with Terraform

This project provisions AWS infrastructure using Terraform 1.x, including:

- An S3 bucket to store the Terraform state
- A VPC with two subnets (public and private)
- An EKS cluster
- Two EKS node groups (one in each subnet)
- An AWS ECR repository for container images
- IAM roles and necessary permissions

---

## Prerequisites

- Terraform version >= 1.3.0
- AWS CLI configured with proper credentials and profile
- AWS account with permissions to create resources listed above

---

## Setup and Deployment

1. **Clone the repository:**

   ```bash
   git clone https://github.com/YourUserName/YourRepoName.git
   cd YourRepoName/terraform

