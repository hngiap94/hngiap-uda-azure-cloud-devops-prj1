variable "resource_group" {
  type        = string
  description = "Name of the resource group"
#   default     = ""
}

variable "location" {
  type        = string
  description = "The Azure region where resources are created"
  default     = "East US"
}