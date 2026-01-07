# Architecture Overview

This document describes the architecture of the Azure Static Web App project, including the hosting model, Terraform structure, CI/CD workflow, and supporting services. It provides a high‑level view for recruiters, engineers, and stakeholders who want to understand how the system is designed and deployed.

---

## 1. High-Level Architecture

The solution consists of three major components:

1. **Static Website**  
   A lightweight static site (HTML/CSS or framework-based) deployed to Azure Static Web Apps.

2. **Infrastructure as Code (Terraform)**  
   A Terraform module that provisions the Azure Static Web App resource, supporting configuration, and optional backend state.

3. **CI/CD Pipeline (GitHub Actions)**  
   Automated workflows for:
   - Building and deploying the static site  
   - Running Terraform linting, validation, and optional plan/apply  
   - Enforcing formatting and security checks  

### Diagram (placeholder)
[ placeholder ]

---

## 2. Azure Static Web App Architecture

Azure Static Web Apps provides:

- Global distribution via Azure Front Door  
- Automatic SSL certificates  
- GitHub Actions integration  
- Zero‑downtime deployments  
- Optional API backend (not used in this project)

### Key characteristics

- **Static content only** — no server-side compute  
- **Automatic build and deploy** from GitHub  
- **Environment separation** via branches (optional)  
- **Custom domains** supported (future enhancement)

---

## 3. Terraform Architecture

Terraform is used to provision and manage the Azure Static Web App resource.

### Module Structure

infra/
└── static-site/
├── main.tf
├── variables.tf
├── outputs.tf
├── versions.tf


### Responsibilities

- Create Azure Static Web App  
- Configure SKU, location, and deployment token  
- Output values for CI/CD integration  
- Enforce formatting, linting, and security scanning via CI

### Diagram (placeholder)
[ placeholder ]


---

## 4. CI/CD Architecture

GitHub Actions orchestrates the full deployment lifecycle.

### Static Site Pipeline

- Install dependencies  
- Build the site  
- Run formatting/linting  
- Deploy to Azure Static Web Apps  

### Terraform Pipeline

- `terraform fmt`  
- `tflint`  
- `tfsec`  
- `terraform validate`  
- Optional: `terraform plan` on PR, `apply` on merge  

### Diagram (placeholder)
[ placeholder ]


---

## 5. Security & Governance

This project includes several governance controls:

- **Branch protection** on `main`  
- **Required PR reviews**  
- **Small, focused feature branches**  
- **Conventional commit messages**  
- **Automated linting and security scanning**  
- **.editorconfig** for consistent formatting  

Future enhancements:

- Add Dependabot  
- Add CodeQL scanning  
- Add Terraform state backend with secure credentials  

---

## 6. Future Enhancements

This architecture is intentionally minimal but extensible. Planned improvements include:

- Custom domain support  
- Staging environments  
- API backend using Azure Functions  
- CDN rules and caching policies  
- More advanced Terraform module structure  

---

## 7. Summary

This architecture demonstrates a clean, modern approach to deploying a static website on Azure using Terraform and GitHub Actions. It highlights best practices in:

- Infrastructure as Code  
- CI/CD automation  
- Documentation and governance  
- Cloud-native hosting  