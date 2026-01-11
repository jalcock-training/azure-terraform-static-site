# Azure Static Website Module

A minimal, production‑ready Terraform module for deploying a static website using **Azure Storage Account Static Website Hosting**.  
This module is intentionally simple, focusing on clean resource provisioning, predictable naming, and compatibility with modern CI/CD pipelines.

---

## Features

- Creates a dedicated **Resource Group**
- Provisions an **Azure Storage Account** with static website hosting enabled
- Configurable **index** and **error** documents
- Sanitizes the storage account name to meet Azure naming rules
- Consistent tagging across all resources
- Outputs suitable for deployment automation (e.g., GitHub Actions)

This module does **not** include CDN, Front Door, DNS, or WAF.  
It is designed to be a clean, minimal building block.

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
}

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

## Architecture

### Static Website Hosting (default)

Resource Group
└── Storage Account
└── Static Website ($web)


The `$web` container is automatically created and configured by the
`azurerm_storage_account_static_website` resource.

---

## Security Notes

- Storage account names are sanitized to meet Azure naming rules.
- Static website hosting does **not** require public blob access.
- No secrets or access keys are output by the module.
- All resources support tagging for governance and cost management.

---

## Naming Conventions

The module uses the provided `site_name` as the base for:

- Storage account name (sanitized to lowercase alphanumeric)
- Resource tagging

This ensures consistent, predictable naming across environments.

---

## Requirements

- Terraform `>= 1.5.0`
- AzureRM provider `~> 4.0`

---

## Future Enhancements (Stretch Ideas)

- Optional CDN or Front Door integration
- Custom domain + HTTPS support
- Diagnostic settings for Storage Account
- Private endpoints for internal hosting
- Role assignments for CI/CD identities

---

## License

See the repository LICENSE file.
```
