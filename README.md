# Azure Terraform Static Site

A static website deployed to Azure using Terraform and GitHub Actions, demonstrating modern cloud engineering practices including infrastructure‑as‑code, OIDC‑based CI/CD, and clean environment separation.

This project is intentionally minimal, focusing on clarity, reproducibility, and senior‑level engineering patterns.

---

## Project Overview

This project provisions and deploys a static website to Azure using Terraform and a fully automated GitHub Actions pipeline.

Key goals:

- Provision Azure infrastructure using Terraform (dev + prod)
- Host a static website using Azure Storage Account Static Website Hosting
- Deploy automatically using GitHub Actions with OIDC authentication
- Maintain a clean, modular, and auditable repository structure
- Demonstrate a real dev -> main promotion workflow

---

## Architecture Summary

The high-level architecture includes:

- Azure Storage Accounts (dev + prod):
  Used for static website hosting via the $web container.
- Terraform:
  Manages all infrastructure, including resource groups, storage accounts, and RBAC.
- GitHub Actions (build and deployment pipeline)
  - Static site deployment pipeline
  - Terraform CI pipeline (fmt, validate, lint, security scan)
  - OIDC‑based Azure authentication (no secrets)
- Branch‑based environment separation
  - dev branch -> deploys to dev environment
  - main branch -> deploys to prod environment

A full architecture diagram will be added in `/docs/architecture.md`.

---

## Repository Structure

/src # Static website source code
/terraform # Terraform configuration and modules
/docs # Architecture diagrams, ADRs, documentation
.github/workflows # CI/CD pipelines (Terraform + static site deploy)
/test # Optional tests or linting configs

---

## Technology Stack

- **Azure Storage Account Static Website Hosting**
- **Terraform (with tflint, Trivy, terraform-docs)**
- **GitHub Actions (OIDC authentication)**
- **HTML/CSS/JS static site**
- **Azure CLI**

---

## Deployment Workflow

1. Terraform provisions dev and prod infrastructure.
2. GitHub Actions builds the static site
3. Branch rules:
   - Push/merge to dev branch -> deploys to dev site
   - Push/merge to main branch -> deploys to prod site
4. A build timestamp is injected into the footer during deployment.
5. PRs run validation only — no deployments.

A detailed CI/CD explanation is available in `/docs/ci-cd.md`.

---

## Getting Started

### Prerequisites

- Terraform installed locally
- Azure CLI installed
- GitHub repository access
- GitHub Actions enabled

### Local Setup

git clone <git@github.com>:<your-username>/azure-terraform-static-site.git
cd azure-terraform-static-site

---

## Infrastructure

Terraform configuration is located in:

/infra

Includes:

- Resource group creation
- Storage account provisioning (dev + prod)
- Static website hosting configuration
- RBAC assignments for GitHub Actions OIDC
- Outputs for deployment integration

Documentation will be added in `/docs/terraform-module.md`.

---

## Static Website

Source code for the static site is located in:

/src

The site is intentionally minimal and includes a footer with a deployment timestamp injected during CI.

---

## CI/CD

GitHub Actions workflows are located in:

/.github/workflows

Workflows include:

- Terraform CI
  - terraform fmt
  - terraform validate
  - tflint
  - Trivy IaC security scan
- Static site deployment
  - Build site
  - Inject timestamp
  - Upload to $web container
  - Branch‑based environment targeting
  - OIDC authentication (no secrets)

---

## Roadmap

- Add architecture diagram
- Add Terraform module documentation
- Add CI/CD workflows
- Add static site content
- Add automated tests (optional)
- Stretch tasks (not planned):
  - Terraform plan on PR
  - Terraform apply automation
  - Custom domain
  - Availability tests

---

## License

See the LICENSE file for details
