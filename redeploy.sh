#!/bin/bash
# 🔁 redeploy.sh
# This script automates the post-infrastructure steps:
# 1. Updates the kubeconfig to connect to the new EKS cluster
# 2. Installs the NGINX Ingress Controller
# 3. Triggers a new GitHub Actions deployment by pushing a dummy commit
#
# Usage:
#   chmod +x redeploy.sh
#   ./redeploy.sh
# 1. Update kubeconfig to connect to the new EKS cluster
echo "Updating kubeconfig..."
aws eks --region eu-north-1 update-kubeconfig --name my-eks-cluster

# 2. Install ingress-nginx if not already installed
echo "Installing ingress-nginx..."
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx

# 3. Show the LoadBalancer address
echo "Waiting for LoadBalancer EXTERNAL-IP..."
kubectl get svc -n ingress-nginx -w

