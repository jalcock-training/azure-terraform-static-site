# Architecture Overview

This document describes the architecture of the Azure Static Web App project, including the hosting model, Terraform structure, CI/CD workflow, and supporting services. It provides a high‑level view for engineers and stakeholders who want to understand how the system is designed and deployed.

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

### Diagram - High-Level Architecture

                          +-----------------------------+
                          |         GitHub Repo         |
                          |-----------------------------|
                          |  /src (static site code)    |
                          |  /infra (Terraform module)  |
                          |  /docs (architecture, etc.) |
                          +--------------+--------------+
                                         |
                                         | Push / PR
                                         v
                          +-----------------------------+
                          |       GitHub Actions        |
                          |-----------------------------|
                          |  Static Site Pipeline       |
                          |    - Install deps           |
                          |    - Build site             |
                          |    - Deploy to Azure SWA    |
                          |                             |
                          |  Terraform Pipeline         |
                          |    - fmt / validate         |
                          |    - tflint / tfsec         |
                          |    - plan (PR)              |
                          |    - apply (main)           |
                          +--------------+--------------+
                                         |
                                         | Deploy / Provision
                                         v
                   +------------------------------------------------+
                   |             Azure Static Web App               |
                   |------------------------------------------------|
                   |  Global CDN (Front Door)                       |
                   |  SSL / HTTPS                                   |
                   |  Zero‑downtime deployments                     |
                   |  Static content hosting                        |
                   |  Optional API backend (future)                 |
                   +------------------------------------------------+
                                         |
                                         | Serves content globally
                                         v
                          +-----------------------------+
                          |         End Users           |
                          |-----------------------------|
                          |  Browser requests static    |
                          |  content from global edge   |
                          +-----------------------------+

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
├── static-site/
├── main.tf
├── variables.tf
├── outputs.tf
├── versions.tf

### Responsibilities

- Create Azure Static Web App
- Configure SKU, location, and deployment token
- Output values for CI/CD integration
- Enforce formatting, linting, and security scanning via CI

### Diagram - Terraform Architecture

                     +-----------------------------+
                     |        Developer            |
                     |-----------------------------|
                     |  Writes / updates .tf files |
                     |  Runs fmt / validate locally|
                     +--------------+--------------+
                                    |
                                    | git push / PR
                                    v
                     +-----------------------------+
                     |       GitHub Actions        |
                     |-----------------------------|
                     |  Terraform Workflow         |
                     |-----------------------------|
                     |  1. terraform fmt -check    |
                     |  2. tflint                  |
                     |  3. tfsec                   |
                     |  4. terraform validate      |
                     |  5. terraform plan (PR)     |
                     +--------------+--------------+
                                    |
                                    | PR approved & merged
                                    v
                     +-----------------------------+
                     |       GitHub Actions        |
                     |-----------------------------|
                     |  Main Branch Workflow       |
                     |-----------------------------|
                     |  1. terraform init          |
                     |  2. terraform plan          |
                     |  3. terraform apply         |
                     +--------------+--------------+
                                    |
                                    | Provision resources
                                    v
                     +-----------------------------+
                     |        Azure Resource       |
                     |-----------------------------|
                     |  Static Web App             |
                     |  Resource Group             |
                     |  Supporting config          |
                     +-----------------------------+

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

### Diagram - CI/CD Architecture

For the full CI/CD pipeline architecture diagram, see the "CI/CD Pipeline" section in `/docs/architecture.md`.

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
