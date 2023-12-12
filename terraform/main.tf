provider "azurerm" {
  features {}
}

data "azurerm_image" "app" {
  name                = "udacity-packer-image"
  resource_group_name = var.resource_group
  location = var.location
}