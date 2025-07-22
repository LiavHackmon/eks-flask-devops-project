# 🧪 DevOps Project – Flask App on EKS (Terraform + Docker + Helm + GitHub Actions)

This project provisions AWS infrastructure using Terraform, containerizes a Flask application with Docker, deploys it using Helm on Amazon EKS, and automates the workflow with GitHub Actions CI/CD.

---

## 📦 Project Overview

- 🚀 **Terraform** – Provision AWS infrastructure
- 🐳 **Docker** – Containerize a Flask application
- 🧱 **ECR** – Store container images
- ☸️ **EKS** – Host the application on Kubernetes
- ⚙️ **Helm** – Manage Kubernetes deployments
- 🤖 **GitHub Actions** – Automate build, push, and deployment

---

## ✅ Infrastructure Provisioning (Terraform)

Terraform provisions the following AWS resources:

- S3 bucket for remote Terraform state
- VPC with one public and one private subnet
- EKS cluster (Amazon Kubernetes Service)
- Two node groups (one in each subnet)
- ECR repository for Docker images
- IAM roles and policies

### 🔧 Setup Instructions

1. Navigate to the Terraform directory:

   ```bash
   cd terraform
Initialize Terraform and apply:
terraform init
terraform apply

Terraform will output:
EKS cluster name
EKS cluster endpoint
ECR repository URL
IAM role ARN

Docker Image & ECR
The Flask app is located in the app/ directory.

To build and push the image manually (optional step):
chmod +x push-to-ecr.sh
./push-to-ecr.sh

This script will:
Build the image from app/
Authenticate to ECR
Tag the image correctly
Push it to the ECR repository

Note: The image is automatically built and pushed during GitHub Actions as well.

Deploying with Helm
The Helm chart is located under helm/my-app.

Features:
Customizable image and tag
Resource limits
Ingress support
Configurable replica count

CI/CD with GitHub Actions
This project includes a full GitHub Actions pipeline.
On every push to the main branch, the following happens:

✅ Code is checked out

✅ Docker image is built using the latest commit SHA

✅ Image is tagged and pushed to ECR

✅ Helm upgrade is triggered on EKS with the new image tag

Benefits:
Image tags are unique per commit (<image>:<commit-sha>)
Fully automated deployment
Easy rollback and traceability


The application is exposed to the internet using NGINX Ingress Controller.

Example endpoint:
http://a9c71437b84d34f1891081733e5ecfe3-c9aff8857bb8072d.elb.eu-north-1.amazonaws.com
Note: This endpoint is dynamically created by AWS and may change when infrastructure is destroyed and recreated.

To retrieve your current endpoint:
kubectl get svc -n ingress-nginx
Look for the EXTERNAL-IP under the ingress-nginx-controller service.

---

## ⚙️ Bonus – Provisioning via GitHub Actions

To provision the infrastructure from GitHub, you can trigger the following workflow manually:

**File**: `.github/workflows/infra.yml`

**How to use**:
1. Go to the "Actions" tab in GitHub
2. Find "Provision Infrastructure with Terraform"
3. Click "Run workflow"

This will execute `terraform init` and `terraform apply` from the `terraform/` directory.


## 🧠 Monitoring (Bonus)

As part of the second bonus task, a professional monitoring stack was deployed using Prometheus and Grafana via the official `kube-prometheus-stack` Helm chart.

All core components were successfully installed, including:
- Prometheus
- Alertmanager
- Grafana
- Node Exporter
- Kube State Metrics

Metrics were collected from all EKS cluster nodes and visualized in a built-in Grafana dashboard.

### 🔍 Sample from the dashboard (CPU and Memory Utilisation):

![Grafana Dashboard](./screenshots/grafana-dashboard.png)






