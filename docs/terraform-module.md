# Terraform Module Overview

This document describes the Terraform module used to provision the Azure Static Web App and supporting resources for this project. It explains the module structure, inputs, outputs, and how the module integrates with the CI/CD pipeline.

---

## 1. Purpose

The Terraform module provides a clean, reusable, and version-controlled way to deploy the Azure Static Web App infrastructure. It ensures:

- Consistent provisioning across environments
- Declarative, auditable infrastructure
- Automated validation, linting, and security scanning
- Seamless integration with GitHub Actions

The module is intentionally minimal for Phase 1 but designed to be extended in future phases.

---

## 2. Module Structure

The module lives under:

infra/static-site/

Directory layout:

infra/
└── static-site/
├── main.tf
├── variables.tf
├── outputs.tf
└── versions.tf

### File Responsibilities

- **main.tf**  
  Defines the Azure Static Web App resource and any supporting configuration.

- **variables.tf**  
  Declares input variables with descriptions and types.

- **outputs.tf**  
  Exposes values used by CI/CD (e.g., deployment token, resource name).

- **versions.tf**  
  Specifies provider versions and Terraform version constraints.

---

## 3. High-Level Module Architecture

+--------------------------------------------------------+
| Terraform Module: static-site |
|--------------------------------------------------------|
| Inputs: |
| - name |
| - location |
| - resource_group_name |
| - sku |
| |
| main.tf |
| - azurerm_static_site |
| - supporting config |
| |
| Outputs: |
| - static_site_name |
| - default_host_name |
| - deployment_token |
+--------------------------------------------------------+

---

## 4. Inputs

Below is a typical set of inputs (your actual variables may differ slightly):

| Variable            | Type   | Description                                   |
| ------------------- | ------ | --------------------------------------------- |
| name                | string | Name of the Static Web App                    |
| location            | string | Azure region                                  |
| resource_group_name | string | Resource group where the app will be deployed |
| sku                 | string | Pricing tier (e.g., Free, Standard)           |

Inputs are validated through CI using:

- terraform fmt -check
- tflint
- tfsec
- terraform validate

---

## 5. Outputs

The module exposes values required by the CI/CD pipeline:

| Output            | Description                                  |
| ----------------- | -------------------------------------------- |
| static_site_name  | Name of the deployed Static Web App          |
| default_host_name | Public hostname of the app                   |
| deployment_token  | Token used by GitHub Actions for deployments |

These outputs allow the static site pipeline to deploy directly to Azure.

---

## 6. Example Usage

module "static_site" {
source = "./infra/static-site"
name = var.name
location = var.location
resource_group_name = var.resource_group_name
sku = var.sku
}

---

## 7. CI/CD Integration

The Terraform module is validated and applied through GitHub Actions.

### Pull Requests

- terraform fmt -check
- tflint
- tfsec
- terraform validate
- terraform plan (read-only)

### Main Branch

- terraform init
- terraform plan
- terraform apply

The module’s outputs (especially the deployment token) are consumed by the static site deployment workflow.

---

## 8. Future Enhancements

Planned improvements include:

- Azure Storage + Key Vault for remote state
- Staging environments
- Custom domain support
- Azure Functions backend
- Monitoring and logging resources
- Multi-module structure for larger deployments

---

## 9. Summary

This Terraform module provides a clean, reusable foundation for provisioning the Azure Static Web App infrastructure. It integrates tightly with the CI/CD pipeline, enforces best practices through automated validation, and is designed to evolve as the project grows.
