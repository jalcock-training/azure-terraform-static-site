terraform {
  required_version = ">= 1.5.0"
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "tfstatejames123"
    container_name       = "tfstate"
    key                  = "staticsite-prod.tfstate"
  }
}
