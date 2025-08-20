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
