# ADR: Hosting Choice

## Status

Accepted

## Context

We need a hosting platform for a static website with global distribution, CI/CD integration, and low operational overhead.

## Options Considered

1. Azure Static Web Apps
2. Azure Storage + CDN
3. GitHub Pages
4. Netlify / Vercel

## Decision

We chose **Azure Static Web Apps**.

## Rationale

- Built‑in CI/CD integration with GitHub Actions
- Global CDN via Azure Front Door
- Zero‑downtime deployments
- Free tier suitable for this project
- Clean developer workflow
- Easy to integrate with Terraform

## Consequences

- Ties the project to Azure ecosystem
- Future backend APIs should use Azure Functions for tight integration
