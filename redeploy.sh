#!/bin/bash

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

