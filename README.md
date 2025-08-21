# DevOps Practical Assessment: AWS ECS Deployment & Security Skills

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
│       ├── ecr/
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

## **Part 1: Containerizing the Application (Docker)**

### **Dockerfile**
- Uses a **multi-stage build** to minimize image size.
- Runs as a **non-root user** (`node`).
- Installs only **production dependencies**.
- Excludes unnecessary files via `.dockerignore`.

### **How to Build and Run Locally**
1. Navigate to the `app/` directory:
   ```bash
   cd app/

2. Build the Docker image:
    ```bash
    docker build -t node-app .

3. Run the container:
    ```bash
    docker run -p 3000:3000 node-app

4. Test locally Access the app at http://localhost:3000.

## **Part 2: Infrastructure as Code with Terraform (AWS ECS)**
### **Goal: Deploy the containerized app on AWS ECS using Terraform.**
#### **Steps:**
1. Initialize Terraform:
    Create a modular structure
    ## **How to Deploy**
    1. Navigate to the terraform/ directory
    2. Initialize Terraform:
    3. Review the plan:
    4. Apply the configuration:
    5. Access the app via the ALB DNS name (output after deployment).

2. Networking (VPC, Subnets, Security Groups):
    Use the AWS VPC module for best practices.
    Create public/private subnets, NAT gateway, and security groups:
        ALB SG: Allow HTTP/HTTPS (80/443) from the internet.
        ECS SG: Allow traffic only from the ALB on port 3000.

3. ECS Cluster & Task Definition:
    Create an ECS cluster.
    Define a task with:
        Container image from ECR.
        Port mapping (3000).
        Environment variables (e.g., `NODE_ENV=production`).

