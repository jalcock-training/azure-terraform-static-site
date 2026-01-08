variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to create."

  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "resource_group_name cannot be empty."
  }
}

variable "location" {
  type        = string
  description = "Azure region for all resources."

  validation {
    condition     = length(var.location) > 0
    error_message = "location cannot be empty."
  }
}

variable "site_name" {
  type        = string
  description = "Base name for the static site resources."

  validation {
    condition = (
      length(var.site_name) >= 3 &&
      length(var.site_name) <= 24 &&
      can(regex("^[a-zA-Z0-9-]+$", var.site_name))
    )
    error_message = "site_name must be 3–24 characters and contain only letters, numbers, and hyphens."
  }
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources."
  default     = {}

  validation {
    condition     = alltrue([for k, v in var.tags : length(k) > 0 && length(v) > 0])
    error_message = "All tag keys and values must be non-empty strings."
  }
}

variable "index_document" {
  type        = string
  description = "Name of the index document."
  default     = "index.html"

  validation {
    condition     = length(var.index_document) > 0
    error_message = "index_document cannot be empty."
  }
}

variable "error_document" {
  type        = string
  description = "Name of the error document."
  default     = "404.html"

  validation {
    condition     = length(var.error_document) > 0
    error_message = "error_document cannot be empty."
  }
}

variable "enable_cdn" {
  type        = bool
  description = "Whether to deploy a CDN endpoint for the static site."
  default     = false
}
