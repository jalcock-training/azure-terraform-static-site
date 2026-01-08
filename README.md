# Azure Terraform Static Site

A static website deployed to Azure using Terraform for full infrastructure-as-code provisioning.  
This project demonstrates modern cloud engineering practices including IaC, GitHub Actions CI/CD, and structured repository workflows.

---

## Project Overview

This project provisions and deploys a static website to Azure using Terraform.  
It is designed as a clean, minimal example of a fully automated cloud deployment pipeline.

Key goals:

- Use Terraform to provision Azure resources
- Deploy a static website to Azure Static Web Apps
- Implement CI/CD using GitHub Actions
- Maintain a clean, modular repository structure

---

## Architecture Summary

The high-level architecture includes:

- Azure Static Web App (hosting the static site)
- GitHub Actions (build and deployment pipeline)
- Terraform (infrastructure provisioning)
- Azure Resource Group (project isolation)

A full architecture diagram will be added in `/docs/architecture.md`.

---

## Repository Structure

/src # Website source code
/infra # Terraform configuration and modules
/docs # Architecture, ADRs, and project documentation
.github/workflows # CI/CD pipelines
/test # Optional tests or linting configs

---

## Technology Stack

- **Azure Static Web Apps**
- **Terraform**
- **GitHub Actions**
- **HTML/CSS/JS or chosen static site framework**
- **Azure CLI** (optional for local validation)

---

## Deployment Workflow

1. Terraform provisions Azure resources
2. GitHub Actions builds the static site
3. GitHub Actions deploys to Azure Static Web Apps
4. Merges into `main` trigger the full pipeline

A detailed CI/CD explanation will be added in `/docs/ci-cd.md`.

---

## Getting Started

### Prerequisites

- Terraform installed locally
- Azure CLI installed
- GitHub repository access
- GitHub Actions enabled

### Local Setup

git clone git@github.com:<your-username>/azure-terraform-static-site.git
cd azure-terraform-static-site

---

## Infrastructure

Terraform configuration is located in:

/infra

Includes:

- Resource group creation
- Static Web App provisioning
- Outputs for deployment integration

Documentation will be added in `/docs/terraform-module.md`.

---

## Static Website

Source code for the static site is located in:

/src

This may be plain HTML/CSS or a static framework such as Astro, Hugo, or Jekyll.

---

## CI/CD

GitHub Actions workflows are located in:

/.github/workflows

These will include:

- Terraform validation
- Static site build
- Deployment to Azure

---

## Roadmap

- Add architecture diagram
- Add Terraform module documentation
- Add CI/CD workflows
- Add static site content
- Add automated tests (optional)

---

## License

See the LICENSE file for details
