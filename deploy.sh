#!/bin/bash
set -e

echo "=== ECR login ==="
aws ecr get-login-password --region us-east-1 \
| docker login --username AWS --password-stdin 676878928643.dkr.ecr.us-east-1.amazonaws.com

echo "=== Pull latest image ==="
docker compose pull

echo "=== Restart containers ==="
docker compose up -d --remove-orphans

echo "=== Deploy done ==="
