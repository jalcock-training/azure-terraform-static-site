module "static_site" {
  source = "../../modules/static_site"

  # required inputs
  site_name           = "static-site-ja-prod01"
  resource_group_name = "rg-staticsite-prod"
  location            = "australiaeast"

  tags = {
    Owner = "James"
  }
}
