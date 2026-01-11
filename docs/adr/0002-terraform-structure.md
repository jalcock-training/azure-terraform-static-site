# ADR 0002: Terraform Structure

## Status

Accepted

## Context

The project requires Infrastructure as Code (IaC) to provision and manage the Azure resources used for static website hosting. Terraform is used to ensure reproducibility, governance, and compatibility with the GitHub Actions CI pipeline.

A key architectural decision is how to structure Terraform within the repository. Several patterns exist, each with different trade‑offs in complexity, scalability, and clarity.

The structure must support:

- A simple Phase 1 deployment
- Clean integration with GitHub Actions using OIDC
- A clear separation between application code and infrastructure
- Future expansion (e.g., staging environments, CDN, DNS, remote state)

## Options Considered

### 1. Single root Terraform configuration in `/terraform`

All Terraform files live directly under `/terraform` without modules.

#### Pros

- Simple
- Easy to understand for small projects

#### Cons

- Harder to scale as more resources are added
- No encapsulation or reuse
- Becomes messy as the project grows

---

### 2. Multi‑module structure with a root module and child modules

A root module orchestrates one or more child modules (e.g., static site, networking, monitoring).

#### Pros - Multi‑module structure with a root module and child modules

- Highly scalable
- Clean separation of concerns
- Easy to extend with new modules

#### Cons - Multi‑module structure with a root module and child modules

- Overkill for Phase 1
- More boilerplate
- Requires more documentation and structure upfront

---

### 3. Single‑purpose module under `/terraform/modules/static_site` (chosen)

A dedicated module encapsulates all resources for the static website hosting environment.  
The root module is minimal and simply consumes this module.

#### Pros - Single‑purpose module

- Clean separation between app code and IaC
- Encapsulates all static website hosting logic (RG, Storage Account, Static Website)
- Easy to extend later (e.g., add modules for CDN, DNS, monitoring)
- Works cleanly with CI workflows (validation only)
- Keeps Phase 1 simple while enabling future growth

#### Cons - Single‑purpose module

- Slightly more structure than a flat layout
- Requires module documentation (provided in the module README)

---

## Decision

We chose **Option 3: a single‑purpose Terraform module under `/terraform/modules/static_site`**, consumed by a minimal root configuration.

This provides the right balance between simplicity and scalability. It keeps Phase 1 clean and focused while allowing the project to evolve into a multi‑module architecture in later phases.

---

## Rationale

- Encourages modular, maintainable IaC from the start
- Keeps the root configuration small and readable
- Aligns with Terraform best practices for real‑world projects
- Supports CI workflows cleanly (fmt, validate, lint, security scan)
- Avoids premature complexity while still being future‑proof
- Matches the minimal hosting architecture (Storage Account Static Website Hosting)

---

## Consequences

### Positive

- Clear separation of concerns
- Easy to extend with additional modules
- Terraform code remains organized and maintainable
- CI integration is straightforward
- Module can be reused across dev/prod environments

### Negative

- Slightly more initial structure than a flat layout
- Requires module documentation (handled in the module’s own README)

---

## Future Considerations

As the project grows, the Terraform structure may evolve into a multi‑module architecture, adding modules for:

- CDN or Front Door
- DNS and custom domains
- Monitoring and diagnostics
- Remote state backend
- Additional application components

This ADR remains valid as the foundation for that evolution.
