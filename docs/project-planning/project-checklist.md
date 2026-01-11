# Static Website Project — Updated Engineering Checklist

A structured, end‑to‑end plan for delivering an Azure static website using Terraform and GitHub Actions with OIDC.

---

## PHASE 1 — Project Foundation

### Repository initialization  
[x] Create public repo  
[x] Add .gitignore, LICENSE, README  
[x] Add .editorconfig  
[x] Establish base folder structure  
[x] Enable Issues and PRs  

### Workflow governance  
[x] Configure branch protection for main  
[x] Require PR reviews  
[x] Add PR template  
[x] Add Issue templates  
[x] Create Project board (Kanban)

---

## PHASE 2 — Architecture & Documentation

### Architecture  
[x] High‑level architecture diagram  
[x] Terraform workflow diagram  
[x] CI/CD pipeline diagram  

### Documentation  
[x] /docs/architecture.md  
[x] /docs/ci-cd.md  
[x] /docs/terraform-module.md  
[x] ADR: hosting choice  
[x] ADR: Terraform structure  

---

## PHASE 3 — Static Website

### Website  
[x] Scaffold site (HTML/CSS)  
[x] Implement layout + content  
[x] Add footer with build timestamp  

### Quality  
[x] Add formatting/linting (Prettier, markdownlint)  
[x] Optional tests  

---

## PHASE 4 — Terraform Infrastructure

### Module  
[x] main.tf  
[x] variables.tf  
[x] outputs.tf  
[x] versions.tf  

### Best practices  
[x] tflint  
[x] tfsec  
[x] terraform-docs  
[x] terraform fmt enforcement  

### Validation  
[x] terraform init  
[x] terraform validate  
[x] terraform plan  

---

## PHASE 5 — CI/CD Automation (OIDC + Storage Account)

### Static site pipeline  
[x] GitHub Actions workflow for static site  
[x] OIDC authentication (no secrets)  
[x] Branch‑based environment selection (dev → dev site, main → prod site)  
[x] Inject build timestamp  
[x] Upload to $web using Azure CLI + RBAC  
[x] PR workflows validated (no deploy on PR)  
[x] Dev → main promotion path working  

### Terraform pipeline  
[x] Add Terraform CI workflow  
[x] Run terraform fmt in CI  
[x] Run tflint in CI  
[x] Run IaC security scan in CI (Trivy)  
[x] Run terraform validate in CI  
[ ] Optional: Terraform plan on PR  
[ ] Optional: Terraform apply on merge to dev/main  

### Identity & security  
[x] OIDC federated credentials for dev, main, and PRs  
[x] RBAC roles assigned (Contributor + Storage Blob Data Contributor)  
[x] No long‑lived secrets required  

---

## PHASE 6 — Deployment & Validation

### Deployment  
[x] Deploy infrastructure (dev + prod)  
[x] Deploy static site (dev + prod)  
[x] Confirm branch‑based deployments work end‑to‑end  

### Validation  
[x] Confirm HTTPS works (Storage Account static sites)  
[ ] Optional: Add custom domain  
[ ] Optional: Add availability/smoke tests  

---

## PHASE 7 — Polish

[ ] Add screenshots (site, pipelines, diagrams)  
[ ] Finalize README with architecture + pipeline explanation  
[ ] Add GitHub topics/tags  
[ ] Clean commit history (squash, conventional commits)
