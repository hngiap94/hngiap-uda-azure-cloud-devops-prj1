provider "azurerm" {
  features {}
}

data "azurerm_image" "app" {
  name                = "udacity-packer-image"
  resource_group_name = var.resource_group
  location = var.location
}

resource "azurerm_virtual_network" "main" {
  name                = "${var.project}-network"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group

  subnet {
    name           = "${var.project}-subnet"
    address_prefix = "10.0.1.0/24"
  }

  tags = {
    project     = "udacity1"
  }
}