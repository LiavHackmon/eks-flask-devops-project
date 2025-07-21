#!/bin/bash

set -e  

AWS_REGION=$(terraform output -raw aws_region 2>/dev/null || echo "eu-north-1")
AWS_PROFILE="default"  

LOCAL_IMAGE_NAME="my-app"

ECR_URI=$(terraform output -raw ecr_repository_url)

echo "Logging in to AWS ECR..."
aws ecr get-login-password --region $AWS_REGION --profile $AWS_PROFILE | docker login --username AWS --password-stdin $ECR_URI

echo "Building Docker image: $LOCAL_IMAGE_NAME"
docker build -t $LOCAL_IMAGE_NAME ./app

echo "Tagging image with ECR URI..."
docker tag ${LOCAL_IMAGE_NAME}:latest ${ECR_URI}:latest

echo "Pushing image to ECR..."
docker push ${ECR_URI}:latest

echo "Done! Image pushed to: ${ECR_URI}:latest"

