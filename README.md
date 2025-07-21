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



The Flask application is located in the app/ directory.
To simplify the process of building and pushing the Docker image to AWS ECR, we created a helper script named push-to-ecr.sh.

This script is located in the root of the project and helps you:

1) Build the Docker image from the app/ folder
2) Authenticate with AWS ECR
3) Tag the image
4) Push it to the ECR repository that was created using Terraform

- We chose to use a script to avoid running unnecessary Terraform resources while testing the Docker image step.

Steps to use the script:
1) Go to the root of the project (where push-to-ecr.sh is located)
2) Make the script executable:chmod +x push-to-ecr.sh
3) Run the script: ./push-to-ecr.sh

The script will automatically read the ECR repository URL from Terraform output, build the Docker image from the app/ folder, and push it to your ECR.

Make sure the ECR repository exists before running this script (see step 2 above).


