# CI/CD Pipeline Overview

This document describes the continuous integration and continuous delivery (CI/CD) workflows used in this project. The pipelines ensure code quality, enforce governance, and automate deployment of both the static website and the Terraform-managed Azure resources.

---

## 1. Objectives

The CI/CD system is designed to:

- Validate all code before it reaches `main`
- Enforce formatting, linting, and security standards
- Provide preview environments for pull requests
- Automate deployment of the static site
- Automate provisioning of Azure resources using Terraform
- Maintain a clean, auditable, and repeatable delivery process

---

## 2. High-Level Pipeline Structure

The project uses two parallel pipelines:

1. **Static Site Pipeline**  
   Builds and deploys the static website to Azure Static Web Apps.

2. **Terraform Pipeline**  
   Validates, plans, and applies infrastructure changes.

Both pipelines run on pull requests and on merges to `main`, with different behaviours depending on the event.

---

## 3. Static Site Pipeline

### Trigger Conditions
- Pull requests targeting `main`
- Pushes to `main`

### PR Behaviour
- Install dependencies  
- Build the static site  
- Run linters and formatting checks  
- Deploy to an **Azure Static Web Apps preview environment**  
  (isolated environment tied to the PR)

### Main Branch Behaviour
- Install dependencies  
- Build the static site  
- Deploy to **production** Azure Static Web Apps environment  
- Zero‑downtime deployment via Azure Front Door

### Responsibilities
- Ensure the site builds cleanly
- Provide reviewers with a live preview
- Deploy automatically after merge

---

## 4. Terraform Pipeline

### Trigger Conditions
- Pull requests targeting `main`
- Pushes to `main`

### PR Behaviour
- `terraform fmt -check`
- `tflint`
- `tfsec`
- `terraform validate`
- `terraform plan` (read‑only)
- No changes applied

This ensures infrastructure changes are safe, secure, and reviewable.

### Main Branch Behaviour
- `terraform init`
- `terraform plan`
- `terraform apply`

This applies infrastructure changes automatically after merge.

### Responsibilities
- Enforce IaC quality and security
- Prevent misconfigurations from reaching production
- Provide a clear audit trail for all infrastructure changes

---

## 5. Pipeline Architecture Diagram

[placeholder]


---

## 6. Governance & Quality Controls

The CI/CD system enforces:

- **Branch protection** on `main`
- **Required PR reviews**
- **Conventional commit messages**
- **Automated linting and security scanning**
- **Consistent formatting via `.editorconfig`**
- **Small, focused PRs**

These controls ensure the project remains maintainable, secure, and professional.

---

## 7. Future Enhancements

Planned improvements include:

- CodeQL security scanning  
- Dependabot for dependency updates  
- Terraform state backend (Azure Storage + Key Vault)  
- Staging environments  
- Canary deployments  
- More granular workflows (e.g., docs-only pipeline)

---

## 8. Summary

The CI/CD system provides a modern, automated, and secure delivery pipeline for both the static website and the Terraform-managed infrastructure. It ensures that every change is validated, reviewed, and deployed consistently, supporting a clean and professional engineering workflow.
