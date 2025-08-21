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

## **📜 Linux System Administration Scripts**

1. **SSH Hardening**: Secure SSH access by disabling password authentication and root login.
2. **Web Service Debugging**: Diagnose and fix issues with Apache/Nginx not starting on EC2.
3. **Log Analysis & Disk Usage**: Parse application logs for errors and check disk usage thresholds.

---

## **1. SSH Hardening Script**
**Script:** [`ssh-hardening.sh`](scripts/ssh-hardening.sh)

### **Purpose**
Automates the process of securing SSH access by:
- Disabling password authentication (enforcing key-based auth).
- Disabling root login via SSH.
- Restarting the SSH service to apply changes.

### **Prerequisites**
- Run as root or with sudo.
- Ensure key-based authentication is set up for at least one non-root user before running this script.

### **Notes**
- A backup of the original sshd_config is created at /etc/ssh/sshd_config.bak.
- Test SSH access before closing your current session to avoid lockout.

## **2. Web Service Debugging Script**
**Script:** [`web_service-debugging.sh`](scripts/web_service-debugging.sh)

### **Purpose**
Diagnoses and attempts to fix issues with Apache or Nginx not starting on an EC2 instance. It:
- Checks the service status.
- Displays relevant logs.
- Tests the configuration for syntax errors.
- Checks port availability.
- Attempts to restart the service.

### **Prerequisites**
- Run as root or with sudo.
- Specify the service name (apache2 or nginx) as an argument.

### **Notes**
- If the configuration test fails, fix the syntax error in the config file and rerun the script.
- If the port is in use, stop the conflicting service or reconfigure the web service.

## **3. Log Analysis & Disk Usage Script**
**Script:** [`log-analysis.sh`](scripts/log-analysis.sh)

### **Purpose**
- Parses a log file for error occurrences.
- Checks disk usage and alerts if it exceeds a specified threshold.

### **Prerequisites**
The script must be executable:
  - chmod +x analysis.sh
- The log file must exist and be readable.

### **Notes**
- The script outputs the number of errors found in the log file.
- If disk usage exceeds the threshold, it prints a warning.

## 🪪 License

This project is licensed under the **MIT License**.

---