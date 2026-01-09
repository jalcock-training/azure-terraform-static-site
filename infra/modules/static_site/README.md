# Azure Static Website Module

This Terraform module deploys a complete Azure Static Website environment, including:

- Resource Group
- Storage Account
- Static Website configuration
- Optional CDN Profile + Endpoint (disabled by default)

The module is designed to be self‑contained, secure by default, and easy to consume in both small demos and larger infrastructure stacks.

---

## Features

- Creates a fully functional Azure Static Website
- Secure defaults (`allow_blob_public_access = false`)
- Optional CDN integration (`enable_cdn = true`)
- Consistent tagging across all resources
- Clean naming conventions
- Minimal required inputs
- Outputs suitable for CI/CD and deployment automation

---

## Usage

```hcl
module "static_site" {
  source = "../modules/static_site"

  resource_group_name = "rg-demo-static"
  location            = "australiaeast"
  site_name           = "demosite123"

  tags = {
    environment = "dev"
    project     = "static-site"
  }

  # Optional CDN
  enable_cdn = false
}

---
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_storage_account.sa](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_account_static_website.static](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account_static_website) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_error_document"></a> [error\_document](#input\_error\_document) | Name of the error document. | `string` | `"404.html"` | no |
| <a name="input_index_document"></a> [index\_document](#input\_index\_document) | Name of the index document. | `string` | `"index.html"` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure region for all resources. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group to create. | `string` | n/a | yes |
| <a name="input_site_name"></a> [site\_name](#input\_site\_name) | Base name for the static site resources. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to all resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | n/a |
| <a name="output_static_website_url"></a> [static\_website\_url](#output\_static\_website\_url) | n/a |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | n/a |
<!-- END_TF_DOCS -->

---

## Architecture

### Without CDN (default)

Azure Resource Group
└── Storage Account
    └── Static Website ($web)


### With CDN enabled

Azure Resource Group
├── Storage Account
│   └── Static Website ($web)
└── CDN Profile
    └── CDN Endpoint → Origin: Static Website

---

## Security Notes

- `allow_blob_public_access` is set to `false` for security best practices.
  Static website hosting does **not** require public blob access.
- CDN is disabled by default to avoid unnecessary cost.
- All resources support tagging for governance, cost management, and auditability.
- Storage account names are sanitized to meet Azure naming rules and avoid accidental exposure.
- No secrets or access keys are output by the module.

---

## Naming Conventions

The module uses the provided `site_name` as the base for:

- Storage account name (sanitized to meet Azure requirements)
- CDN profile name (if enabled)
- CDN endpoint name (if enabled)

This ensures consistent, predictable naming across environments.

---

## Requirements

- Terraform `>= 1.5.0`
- AzureRM provider `~> 4.0`

---

## Example With CDN Enabled

module "static_site" {
  source = "../modules/static_site"

  resource_group_name = "rg-demo-static"
  location            = "australiaeast"
  site_name           = "demosite123"

  enable_cdn = true
}

---

## Future Enhancements (Optional)

- Support for custom domains and HTTPS (Azure CDN-managed certificates)
- Diagnostic settings for Storage Account and CDN
- Logging and access analytics
- Private endpoints for secure internal hosting
- Role assignments for CI/CD pipelines or automation identities
- CDN Rules Engine configuration (redirects, caching rules, security headers)
- Optional WAF-enabled CDN SKU
- Integration with Azure Front Door as an alternative delivery option
- Module-level naming convention overrides

## License

See repository LICENCE file.
```
