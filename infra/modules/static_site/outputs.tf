output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "storage_account_name" {
  value = azurerm_storage_account.sa.name
}

output "static_website_url" {
  value = azurerm_storage_account_static_website.static.primary_web_endpoint
}

output "cdn_endpoint_url" {
  value       = var.enable_cdn ? azurerm_cdn_endpoint.cdn_endpoint[0].host_name : null
  description = "The CDN endpoint URL, if CDN is enabled."
}
