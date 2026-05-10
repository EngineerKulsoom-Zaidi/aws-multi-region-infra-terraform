# Multi-Region AWS Infrastructure via Terraform 🏗️

This repository contains a modular Terraform configuration to deploy a highly available, multi-region infrastructure on AWS. 

## 🎯 Project Overview
The goal of this project is to demonstrate **Infrastructure as Code (IaC)** best practices by deploying a fault-tolerant web architecture across two AWS regions (e.g., `us-east-1` and `ap-south-1`).

### 🏗️ Architecture Features
- **Multi-Region VPCs:** Isolated networking environments with public and private subnets.
- **High Availability:** Application Load Balancers (ALB) distributing traffic across multiple Availability Zones.
- **Auto-Scaling:** EC2 instances that automatically scale based on demand.
- **Modular Design:** Reusable Terraform modules for VPC and Compute resources.

---

## 🛠️ Tech Stack
- **Cloud Provider:** AWS
- **IaC Tool:** Terraform
- **Networking:** VPC, IGW, NAT Gateway, Route Tables
- **Compute:** EC2, Auto-Scaling Groups, Launch Templates

---

## 📂 Repository Structure
```plaintext
├── modules/
│   ├── vpc/             # Reusable VPC & Networking logic
│   ├── compute/         # EC2, Auto-scaling, ALB logic
├── environments/
│   ├── prod/            # Production environment variables
│   ├── staging/         # Staging environment variables
├── main.tf              # Main entry point (Root Module)
├── variables.tf         # Global input variables
├── outputs.tf           # Resource IDs and DNS endpoints
└── README.md            # This file
