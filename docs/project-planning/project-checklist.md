Static Website Project — Engineering Checklist
==============================================

A structured, end-to-end plan for delivering an Azure Static Web App using Terraform and GitHub Actions.

---------------------------------------------------
PHASE 1 — Project Foundation
---------------------------------------------------

[ ] Repository initialization
    [x] Create public repo
    [x] Add .gitignore, LICENSE, README
    [x] Add .editorconfig
    [x] Establish base folder structure
    [x] Enable Issues and PRs

[ ] Workflow governance
    [x] Configure branch protection for main
    [x] Require PR reviews
    [x] Add PR template
    [x] Add Issue templates
    [x] Create Project board (Kanban)

---------------------------------------------------
PHASE 2 — Architecture & Documentation
---------------------------------------------------

[ ] Architecture definition
    [x] High-level architecture diagram
    [x] Terraform workflow diagram
    [x] CI/CD pipeline diagram

[ ] Documentation
    [x] /docs/architecture.md
    [x] /docs/ci-cd.md
    [x] /docs/terraform-module.md
    [x] ADR: hosting choice
    [x] ADR: Terraform structure

---------------------------------------------------
PHASE 3 — Static Website
---------------------------------------------------

[x] Website scaffold
    [x] Choose framework (HTML/CSS, Astro, Hugo, etc.)
    [x] Implement initial layout
    [x] Add content

[x] Quality controls
    [x] Add formatting/linting (Prettier, markdownlint)
    [x] Add basic tests (optional)

---------------------------------------------------
PHASE 4 — Terraform Infrastructure
---------------------------------------------------

[ ] Terraform module
    [ ] main.tf
    [ ] variables.tf
    [ ] outputs.tf
    [ ] versions.tf

[ ] Infrastructure best practices
    [ ] Add linting/security scanning to CI (tflint, tfsec)
    [ ] Add terraform-docs generation
    [ ] Add terraform fmt enforcement

[ ] Validation
    [ ] terraform init
    [ ] terraform validate
    [ ] terraform plan

---------------------------------------------------
PHASE 5 — CI/CD Automation
---------------------------------------------------

[ ] Static site pipeline
    [ ] Build site
    [ ] Run linting/tests
    [ ] Deploy to Azure Static Web Apps

[ ] Terraform pipeline
    [ ] terraform fmt
    [ ] tflint
    [ ] tfsec
    [ ] terraform validate
    [ ] Optional: plan on PR, apply on merge

[ ] Secrets
    [ ] Azure deployment token
    [ ] Optional: backend credentials

---------------------------------------------------
PHASE 6 — Deployment & Validation
---------------------------------------------------

[ ] Deploy infrastructure
[ ] Deploy static site
[ ] Validate deployment (SSL, domain, availability)

---------------------------------------------------
PHASE 7 — Polish
---------------------------------------------------

[ ] Add screenshots (site, pipelines, diagrams)
[ ] Finalize README
[ ] Add GitHub topics/tags
[ ] Clean commit history (squash, conventional commits)
