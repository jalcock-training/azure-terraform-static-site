# ADR: Hosting Choice

## Status

Accepted

## Context

We need a hosting platform for a static website that is:

- Simple and cost‑effective
- Easy to provision using Terraform
- Compatible with OIDC‑based GitHub Actions deployments
- Suitable for both dev and prod environments
- Low‑maintenance, with minimal operational overhead

The site is fully static (HTML/CSS/JS), with no server‑side compute requirements.

## Options Considered

1. Azure Static Web Apps
2. Azure Storage Account Static Website Hosting
3. Azure Storage + CDN
4. GitHub Pages
5. Netlify / Vercel

## Decision

We chose **Azure Storage Account Static Website Hosting**.

## Rationale

- Extremely low cost and minimal operational overhead
- Native Terraform support with a simple, predictable resource model
- Works seamlessly with GitHub Actions using OIDC (no secrets)
- Straightforward dev → prod environment separation
- No need for SWA‑specific build pipelines or deployment tokens
- Perfect fit for a purely static site without backend APIs
- Easy to extend later with CDN or Front Door if needed

## Consequences

- No built‑in CDN; global acceleration would require a future enhancement
- No preview environments (unlike Azure Static Web Apps)
- Custom domains and HTTPS require additional configuration if added later
- Architecture remains simple, transparent, and easy to maintain
