locals {
  sanitized_site_name = lower(replace(var.site_name, "/[^a-zA-Z0-9]/", ""))

  tags = merge(
    {
      module = "static-site"
    },
    var.tags
  )
}
