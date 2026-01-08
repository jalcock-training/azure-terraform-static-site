resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.tags
}

resource "azurerm_storage_account" "sa" {
  name                     = local.sanitized_site_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Public blob access is not required for static websites
  allow_blob_public_access = false

  tags = local.tags
}

resource "azurerm_storage_account_static_website" "static" {
  storage_account_id = azurerm_storage_account.sa.id
  index_document     = var.index_document
  error_404_document = var.error_document
}

resource "azurerm_cdn_profile" "cdn" {
  count               = var.enable_cdn ? 1 : 0
  name                = "${var.site_name}-cdn"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard_Microsoft"
  tags                = local.tags
}

resource "azurerm_cdn_endpoint" "cdn_endpoint" {
  count               = var.enable_cdn ? 1 : 0
  name                = "${var.site_name}-endpoint"
  profile_name        = azurerm_cdn_profile.cdn[0].name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  origin {
    name      = "staticwebsite"
    host_name = azurerm_storage_account.sa.primary_web_host
  }

  tags = local.tags
}
