variable "apim_name" {
  description = "Azure API Gateway Name"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "location" {
  description = "Azure location."
  type        = string
}

variable "sku_tier" {
  description = "APIM SKU. Valid values include: Developer, Basic, Standard, StandardV2 and Premium."
  type        = string
  default     = "Developer"

  validation {
    condition     = contains(["Developer", "Basic", "Standard", "StandardV2", "Premium"], var.sku_tier)
    error_message = "Invalid SKU tier. Valid values include: Developer, Basic, Standard, StandardV2 and Premium."
  }
}

variable "sku_capacity" {
  description = "APIM SKU capacity."
  type        = number
  default     = 1
}

variable "publisher_name" {
  description = "The name of publisher/company."
  type        = string
}

variable "publisher_email" {
  description = "The email of publisher/company."
  type        = string
}


variable "products" {
  description = "List of products to create."
  type        = list(string)
  default     = []
}