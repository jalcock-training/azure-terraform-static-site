# ADR 0002: Terraform Structure

## Status

Accepted

## Context

The project requires Infrastructure as Code (IaC) to provision and manage the Azure Static Web App and related resources. Terraform is used to ensure reproducibility, governance, and automation through CI/CD.

A key architectural decision is how to structure Terraform within the repository. Several patterns exist, each with different trade-offs in complexity, scalability, and clarity.

The structure must support:

- A simple Phase 1 deployment
- Clean integration with GitHub Actions
- A clear separation between application code and infrastructure
- Future expansion (e.g., staging environments, additional Azure resources, remote state)

## Options Considered

### 1. Single root Terraform configuration in `/infra`

All Terraform files live directly under `/infra` without modules.

**Pros**

- Simple
- Easy to understand for small projects

**Cons**

- Harder to scale as more resources are added
- No encapsulation or reuse
- Becomes messy as the project grows

---

### 2. Multi-module structure with a root module and child modules

A root module orchestrates one or more child modules (e.g., static site, networking, monitoring).

**Pros**

- Highly scalable
- Clean separation of concerns
- Easy to extend with new modules

**Cons**

- Overkill for Phase 1
- More boilerplate
- Requires more documentation and structure upfront

---

### 3. Single-purpose module under `/infra/static-site` (chosen)

A dedicated module encapsulates all resources for the static site. The root module is minimal and simply consumes this module.

**Pros**

- Clean separation between app code and IaC
- Encapsulates Azure Static Web App logic
- Easy to extend later (e.g., add modules for backend, DNS, monitoring)
- Works well with CI/CD workflows
- Keeps Phase 1 simple while enabling future growth

**Cons**

- Slightly more structure than a flat `/infra` folder
- Requires module documentation

---

## Decision

We chose **Option 3: a single-purpose Terraform module under `/infra/static-site`**, consumed by a minimal root configuration.

This provides the right balance between simplicity and scalability. It keeps Phase 1 clean and focused while allowing the project to evolve into a multi-module architecture in later phases.

---

## Rationale

- Encourages modular, maintainable IaC from the start
- Keeps the root configuration small and readable
- Aligns with Terraform best practices for real-world projects
- Supports CI/CD workflows cleanly (plan/apply at the root, logic in modules)
- Avoids premature complexity while still being future-proof

---

## Consequences

### Positive

- Clear separation of concerns
- Easy to extend with additional modules
- Terraform code remains organized and maintainable
- CI/CD integration is straightforward

### Negative

- Slightly more initial structure than a flat layout
- Requires module documentation (added in `/docs/terraform-module.md`)

---

## Future Considerations

As the project grows, the Terraform structure may evolve into a multi-module architecture:
