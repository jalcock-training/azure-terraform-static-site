module "static_site" {
  source = "../../modules/static_site"

  # required inputs
  site_name                = "static-site-ja-dev01"
  resource_group_name = "rg-staticsite-dev"
  location            = "australiaeast"

  tags = {
    Owner = "James"
  }
}
