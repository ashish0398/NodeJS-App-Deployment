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
│   └── Dockerfile
├── terraform/            # Terraform configuration
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── modules/
│       ├── networking/
│       ├── ecs/
│       └── alb/
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