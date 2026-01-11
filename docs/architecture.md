# Architecture Overview

This document describes the architecture of the Azure Static Website project, including the hosting model, Terraform structure, CI/CD workflow, and supporting services. It provides a high‑level view for engineers and stakeholders who want to understand how the system is designed and deployed.

---

## 1. High‑Level Architecture

The solution consists of three major components:

1. **Static Website**  
   A lightweight static site (HTML/CSS) deployed to Azure Storage Account Static Website Hosting.

2. **Infrastructure as Code (Terraform)**  
   A minimal Terraform module that provisions:
   - Resource Group
   - Storage Account
   - Static Website configuration (`$web` container)

3. **CI/CD Pipeline (GitHub Actions)**  
   Automated workflows for:
   - Building and deploying the static site
   - Running Terraform linting, validation, and security scanning
   - Enforcing formatting and repository governance

### Diagram – High‑Level Architecture

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
                          |    - Build site             |
                          |    - Deploy to Azure SWA    |
                          |    - Upload to $web    |
                          |                             |
                          |  Terraform Pipeline         |
                          |    - fmt / validate         |
                          |    - tflint / Trivy         |
                          +--------------+--------------+
                                         |
                                         | Deploy / Provision
                                         v
                   +------------------------------------------------+
                   |       Azure Storage Account (Static Web)       |
                   |------------------------------------------------|
                   |  $web container                                |
                   |  Static content hosting                        |
                   |  HTTPS endpoint                                |
                   +------------------------------------------------+
                                         |
                                         | Serves static content
                                         v
                          +-----------------------------+
                          |         End Users           |
                          |-----------------------------|
                          |  Browser requests static    |
                          |  content from storage       |
                          +-----------------------------+

---

## 2. Azure Static Website Architecture

Azure Storage Account Static Website Hosting provides:

- A globally accessible HTTPS endpoint
- A `$web` container for static content
- Simple, cost‑effective hosting
- No server‑side compute
- No CDN or Front Door by default (can be added later)

### Key characteristics

- **Static content only**
- **HTTPS enabled automatically**
- **Index and error documents configurable**
- **No deployment tokens required**
- **Compatible with OIDC‑based CI/CD**

---

## 3. Terraform Architecture

Terraform provisions all Azure resources required for hosting the static site.

### Module Structure

terraform/
├── modules/
│ └── static_site/
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
│ ├── locals.tf
│ └── versions.tf
├── main.tf
├── variables.tf
├── outputs.tf
└── versions.tf

### Responsibilities

- Create Resource Group
- Create Storage Account
- Enable static website hosting
- Sanitize storage account name
- Output the static website endpoint
- Support tagging and environment separation

### Diagram – Terraform Architecture

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
                     |  Terraform CI Workflow      |
                     |-----------------------------|
                     |  1. terraform fmt -check    |
                     |  2. tflint                  |
                     |  3. Trivy IaC scan          |
                     |  4. terraform validate      |
                     +--------------+--------------+
                                    |
                                    | Manual apply (future stretch)
                                    v
                     +-----------------------------+
                     |        Azure Resource       |
                     |-----------------------------|
                     |  Resource Group             |
                     |  Storage Account            |
                     |  Static Website ($web)      |
                     +-----------------------------+

---

## 4. CI/CD Architecture

GitHub Actions orchestrates the full deployment lifecycle using OIDC authentication (no secrets required).

### Static Site Pipeline

- Build static site
- Inject build timestamp
- Authenticate to Azure via OIDC
- Upload files to `$web` container
- Deploy based on branch:
  - `dev` → dev environment
  - `main` → prod environment

### Terraform Pipeline

- `terraform fmt`
- `tflint`
- `Trivy` (IaC misconfiguration scan)
- `terraform validate`
- No plan/apply (stretch tasks only)

---

## 5. Security & Governance

This project includes several governance controls:

- **Branch protection** on `main`
- **Required PR reviews**
- **Small, focused feature branches**
- **Conventional commit messages**
- **Automated linting and security scanning**
- **.editorconfig** for consistent formatting
- **OIDC authentication** (no secrets in CI/CD)

Future enhancements (stretch):

- Dependabot
- CodeQL scanning
- Terraform remote backend
- CDN or Front Door integration

---

## 6. Future Enhancements

This architecture is intentionally minimal but extensible. Potential improvements include:

- Custom domain + HTTPS
- CDN or Front Door for global acceleration
- Staging environments
- Private endpoints
- Additional monitoring and diagnostics

---

## 7. Summary

This architecture demonstrates a clean, modern approach to deploying a static website on Azure using Terraform and GitHub Actions. It highlights best practices in:

- Infrastructure as Code
- CI/CD automation
- OIDC‑based cloud authentication
- Minimal, maintainable cloud hosting
