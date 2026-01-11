# CI/CD Pipeline Overview

This document describes the continuous integration and continuous delivery (CI/CD) workflows used in this project.  
The pipelines ensure code quality, enforce governance, and automate deployment of the static website hosted in Azure Storage Account Static Website Hosting.

---

## 1. Objectives

The CI/CD system is designed to:

- Validate all code before it reaches `main`
- Enforce formatting, linting, and security standards
- Deploy the static site automatically to dev and prod environments
- Validate Terraform infrastructure using modern IaC tooling
- Maintain a clean, auditable, and repeatable delivery process
- Use OIDC authentication (no secrets in CI/CD)

---

## 2. High‑Level Pipeline Structure

The project uses two parallel pipelines:

1. **Static Site Deployment Pipeline**  
   Builds the static site, injects a timestamp, and uploads it to the `$web` container of the appropriate Storage Account.

2. **Terraform CI Pipeline**  
   Validates Terraform code using formatting, linting, and security scanning.

Both pipelines run on pull requests and on merges to `dev` or `main`, with different behaviours depending on the branch.

---

## 3. Static Site Pipeline

### Trigger Conditions – Static Site Pipeline

- Pushes to `dev`
- Pushes to `main`

### Behaviour – Static Site Pipeline

- Install dependencies (if applicable)
- Build the static site
- Inject a build timestamp into the footer
- Authenticate to Azure using OIDC
- Upload the built site to the `$web` container of:
  - **dev** Storage Account (when pushing to `dev`)
  - **prod** Storage Account (when pushing to `main`)

### Responsibilities – Static Site Pipeline

- Ensure the site builds cleanly
- Provide automatic deployments for both environments
- Maintain a simple, predictable promotion flow (`dev` → `main`)

There are **no preview environments** and **no Azure Static Web Apps** involved.

---

## 4. Terraform Pipeline

### Trigger Conditions – Terraform Pipeline

- Pull requests targeting any branch
- Pushes to `main`

### PR Behaviour – Terraform Pipeline

- `terraform fmt -check`
- `tflint`
- `trivy` (IaC misconfiguration scan)
- `terraform validate`

No plan or apply is executed.  
This ensures infrastructure changes are safe, secure, and reviewable.

### Main Branch Behaviour – Terraform Pipeline

Same as PR behaviour:

- `terraform fmt -check`
- `tflint`
- `trivy`
- `terraform validate`

There is **no automatic plan/apply**.  
Terraform apply is intentionally a **stretch task** and not implemented.

### Responsibilities – Terraform Pipeline

- Enforce IaC quality and security
- Prevent misconfigurations from reaching production
- Maintain a clean, auditable Terraform workflow without auto‑apply

---

## 5. Pipeline Architecture Diagram

Developer Push / PR
        |
        v
+-----------------------------+
|       GitHub Actions        |
+-----------------------------+
|  Terraform CI Pipeline      |
|    - fmt                    |
|    - validate               |
|    - tflint                 |
|    - Trivy IaC scan         |
+-----------------------------+
|  Static Site Pipeline       |
|    - Build site             |
|    - Inject timestamp       |
|    - Upload to $web         |
+-----------------------------+
        |
        v
+-----------------------------+
|        Azure Storage        |
|  (Static Website Hosting)   |
+-----------------------------+

---

## 6. Governance & Quality Controls

The CI/CD system enforces:

- **Branch protection** on `main`
- **Required PR reviews**
- **Conventional commit messages**
- **Automated linting and security scanning**
- **Consistent formatting via `.editorconfig`**
- **Small, focused PRs**
- **Zero secrets** (OIDC authentication)

These controls ensure the project remains maintainable, secure, and professional.

---

## 7. Future Enhancements (Stretch Tasks)

These are intentionally not implemented:

- Terraform plan on PR
- Terraform apply automation
- Remote Terraform backend (Azure Storage + Key Vault)
- CodeQL security scanning
- Dependabot
- CDN or Front Door integration
- Staging environments
- Canary deployments

---

## 8. Summary

The CI/CD system provides a clean, modern, and secure delivery pipeline for both the static website and the Terraform infrastructure.  
It ensures that every change is validated, reviewed, and deployed consistently, supporting a professional and maintainable engineering workflow.
