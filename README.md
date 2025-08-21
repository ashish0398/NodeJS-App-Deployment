# 🚀 Deploy Node.js app to Amazon ECS using GitHub Actions & Terraform

This project demonstrates a **CI/CD pipeline** that builds, pushes, and deploys a **Node.js application** to **Amazon ECS (Elastic Container Service)** using **GitHub Actions** and **Terraform**.

---

## 📂 Project Structure

## **Overview**
This repository contains the solution for the **DevOps Practical Assessment**, focusing on:
- Containerizing a Node.js application with Docker.
- Deploying the app on **AWS ECS** using **Terraform**.
- Integrating **DevSecOps** best practices.
- Demonstrating **Linux scripting and administration** skills.

---

## **Project Structure**
```
.
├── app/                  # Node.js application source
│   ├── app.js
│   ├── package.json
|   |── package-lock.json
│   └── Dockerfile
├── terraform/            # Terraform configuration
│   ├── main.tf
│   ├── outputs.tf
│   └── modules/
│       ├── alb/
│       |── ecs/
|       |── iam/
│       └── vpc/
├── scripts/               # Linux scripts
│   └── analyze_logs.sh
├── docs/                  # Additional documentation
│   └── LinuxTasks.md
└── README.md              # This file
```

---

---

## ⚙️ Workflow Overview

The GitHub Actions workflow is triggered on **push to the `main` branch** and performs the following steps:

1. **Checkout code** – Fetches the latest code from the repository.
2. **Configure AWS credentials** – Uses stored secrets to authenticate with AWS.
3. **Login to Amazon ECR** – Authenticates Docker with Amazon ECR.
4. **Create ECR repository (if not exists)** – Ensures the `nodejs-app` repo is available.
5. **Build, Tag & Push Docker Image** – Builds the Docker image and pushes it to ECR.
6. **Terraform Init/Plan/Apply** – Initializes Terraform, plans changes, and applies them to deploy the ECS service.

---

## 🛠️ Environment Variables

The following environment variables are set in the workflow:

| Variable              | Description |
|-----------------------|-------------|
| `AWS_REGION`          | AWS region where resources are deployed (default: `ap-south-1`) |
| `ECR_REPOSITORY`      | Amazon ECR repository URI |
| `ECS_CLUSTER`         | ECS cluster name |
| `ECS_SERVICE`         | ECS service name |
| `ECS_TASK_DEFINITION` | ECS task definition family |
| `IMAGE_TAG`           | Docker image tag (default: `latest`) |

---

## 🔑 GitHub Secrets Required

Set the following secrets in your GitHub repository:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

---

## 🚀 Deployment Process

1. Push changes to the **`main` branch**.
2. GitHub Actions will:
   - Build & push a new Docker image to **Amazon ECR**.
   - Run **Terraform** to create/update ECS infrastructure.
   - Deploy the latest application to **Amazon ECS**.

---

## 📦 Prerequisites

- AWS Account with permissions for **ECR, ECS, IAM, and VPC**.
- Terraform installed locally (for manual runs).
- GitHub repository with Actions enabled.

---

## 🏗️ Terraform Setup Guide

The `terraform/` folder provisions the required AWS infrastructure for ECS deployment.

### 1. VPC & Networking
- Creates a **VPC**, **subnets** (public/private), and **Internet Gateway**.
- Configures **Security Groups** for ECS tasks and Load Balancer.

### 2. ECS Cluster
- Provisions an **ECS cluster** (`nodejs-cluster`) in the specified region.
- Configured to run **Fargate** tasks (serverless container execution).

### 3. Task Definition
- Defines an **ECS Task Definition** (`nodejs-app`) that references the Docker image in ECR.
- Configures:
  - Container name
  - CPU & memory resources
  - Port mappings (e.g., `80:3000`)

### 4. ECS Service
- Deploys the ECS service (`nodejs-service`) into the cluster.
- Configured to run tasks using Fargate.
- Optionally integrates with an **Application Load Balancer (ALB)** for public access.

### 5. Outputs
After `terraform apply`, you’ll typically see outputs such as:
- **Service URL** (if ALB configured)
- **ECS Cluster & Service names**
- **ECR Repository URI**

---

## 🔍 Verification

After deployment:

- Check the ECS service in the **AWS Management Console**.
- Verify that the ECS task is running the latest Docker image.
- Access the application via the ECS Service Load Balancer or Public IP (if configured in Terraform).

---

## 📜 License

This project is licensed under the **MIT License**.

---