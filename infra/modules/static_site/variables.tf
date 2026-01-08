variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to create."
}

variable "location" {
  type        = string
  description = "Azure region for all resources."
}

variable "site_name" {
  type        = string
  description = "Base name for the static site resources."
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources."
  default     = {}
}

variable "index_document" {
  type        = string
  description = "Name of the index document."
  default     = "index.html"
}

variable "error_document" {
  type        = string
  description = "Name of the error document."
  default     = "404.html"
}

variable "enable_cdn" {
  type        = bool
  description = "Whether to deploy a CDN endpoint for the static site."
  default     = false
}
