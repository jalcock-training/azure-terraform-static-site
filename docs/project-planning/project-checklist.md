Static Website Project — Full Engineering Checklist
===================================================

A complete, end-to-end task list for building a professional, Azure Static Web App project with Terraform.

---------------------------------------------------
PHASE 1 — Project Initialization
---------------------------------------------------

[ ] 1. Create the GitHub Repository
    [ ] Create new public repo
    [ ] Add .gitignore
    [ ] Add LICENSE
    [ ] Add README.md (initial placeholder)
    [ ] Add .editorconfig

[ ] 2. Set Up Repo Structure
    [ ] Create /src
    [ ] Create /infra
    [ ] Create /docs
    [ ] Create /.github/workflows
    [ ] Create /test (optional)

[ ] 3. Enable GitHub Features
    [ ] Enable Issues
    [ ] Create Project board (Kanban)
    [ ] Add Milestones (optional)
    [ ] Configure branch protection rules for main
    [ ] Require PR reviews

---------------------------------------------------
PHASE 2 — Local Development Environment
---------------------------------------------------

[ ] 4. Configure VSCodium Environment
    [ ] Install Terraform extension
    [ ] Install Prettier / ESLint
    [ ] Install Markdown lint
    [ ] Install GitHub Actions extension

[ ] 5. Optional: Dev Container
    [ ] Add .devcontainer/devcontainer.json
    [ ] Include Terraform
    [ ] Include Node
    [ ] Include Azure CLI
    [ ] Include pre-commit hooks

[ ] 6. Install Local Tooling
    [ ] Install Terraform
    [ ] Install TFLint
    [ ] Install tfsec
    [ ] Install terraform-docs
    [ ] Install pre-commit
    [ ] Install Node.js (if needed)

---------------------------------------------------
PHASE 3 — Planning & Documentation
---------------------------------------------------

[ ] 7. Define Project Scope
    [ ] Static website
    [ ] Azure Static Web Apps (Free)
    [ ] Terraform IaC
    [ ] GitHub Actions CI/CD
    [ ] Optional: local container testing

[ ] 8. Create Architecture Diagram
    [ ] Azure Static Web App
    [ ] GitHub Actions
    [ ] Terraform workflow
    [ ] Optional: Terraform backend

[ ] 9. Add Documentation
    [ ] /docs/architecture.md
    [ ] /docs/decisions/adr-001-hosting-choice.md
    [ ] /docs/ci-cd.md
    [ ] /docs/terraform-module.md

---------------------------------------------------
PHASE 4 — Git Workflow Setup
---------------------------------------------------

[ ] 10. Branching Strategy
     [ ] main = production
     [ ] dev (optional)
     [ ] feature/<name> branches
     [ ] fix/<name> branches

[ ] 11. Add PR Templates
     [ ] .github/pull_request_template.md

[ ] 12. Add Issue Templates
     [ ] Bug report template
     [ ] Feature request template

---------------------------------------------------
PHASE 5 — Website Development
---------------------------------------------------

[ ] 13. Build the Static Site
     [ ] Choose framework (HTML/CSS, Astro, Next.js static, Hugo, Jekyll)
     [ ] Implement initial layout
     [ ] Add content

[ ] 14. Add Linting & Formatting
     [ ] Prettier
     [ ] ESLint (if JS)
     [ ] markdownlint

[ ] 15. Add Basic Tests (Optional)
     [ ] HTML validation
     [ ] JS unit tests (if applicable)

---------------------------------------------------
PHASE 6 — Terraform Infrastructure
---------------------------------------------------

[ ] 16. Create Terraform Module
     [ ] main.tf
     [ ] variables.tf
     [ ] outputs.tf
     [ ] versions.tf

[ ] 17. Add Terraform Best Practices
     [ ] terraform fmt
     [ ] tflint
     [ ] tfsec
     [ ] terraform-docs generation
     [ ] Pre-commit hooks

[ ] 18. Local Terraform Validation
     [ ] terraform init
     [ ] terraform validate
     [ ] terraform plan

---------------------------------------------------
PHASE 7 — CI/CD Setup
---------------------------------------------------

[ ] 19. GitHub Actions for Static Site
     [ ] Build site
     [ ] Run linting/tests
     [ ] Deploy to Azure Static Web Apps

[ ] 20. GitHub Actions for Terraform
     [ ] terraform fmt
     [ ] tflint
     [ ] tfsec
     [ ] terraform validate
     [ ] Optional: plan on PR, apply on merge

[ ] 21. Configure Secrets
     [ ] Azure deployment token
     [ ] Optional: Terraform backend credentials

---------------------------------------------------
PHASE 8 — Deployment
---------------------------------------------------

[ ] 22. Deploy Infrastructure
     [ ] terraform apply

[ ] 23. Deploy Static Website
     [ ] GitHub Actions triggers on push to main

[ ] 24. Validate Deployment
     [ ] Check site loads
     [ ] Check SSL
     [ ] Check custom domain (optional)

---------------------------------------------------
PHASE 9 — Polish & Recruiter Readiness
---------------------------------------------------

[ ] 25. Add Screenshots
     [ ] Homepage
     [ ] GitHub Actions passing
     [ ] Architecture diagram

[ ] 26. Finalize README
     [ ] Overview
     [ ] Architecture diagram
     [ ] Tech stack
     [ ] CI/CD explanation
     [ ] Terraform module details
     [ ] Deployment instructions
     [ ] What you learned

[ ] 27. Add Tags & Topics
     [ ] terraform
     [ ] azure
     [ ] static-website
     [ ] iac
     [ ] github-actions

[ ] 28. Clean Commit History
     [ ] Squash unnecessary commits
     [ ] Ensure conventional commit style

---------------------------------------------------
PHASE 10 — Optional Enhancements
---------------------------------------------------

[ ] Automated Testing
     [ ] Lighthouse CI
     [ ] HTML validator

[ ] Makefile
     [ ] make build
     [ ] make deploy
     [ ] make test

[ ] Optional CDN
     [ ] Azure CDN (not free)