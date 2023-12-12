provider "azurerm" {
  features {}
}

data "azurerm_image" "app" {
  name                = "udacity-packer-image"
  resource_group_name = var.resource_group
}

# Virtual network and subnet
resource "azurerm_virtual_network" "main" {
  name                = "${var.project}-network"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group

  tags = {
    project = var.project
  }
}

resource "azurerm_subnet" "main" {
  name                 = "${var.project}-subnet"
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Network security group
resource "azurerm_network_security_group" "main" {
  name                = "${var.project}-nsg"
  location            = var.location
  resource_group_name = var.resource_group

  security_rule {
    name                       = "AllowInboundInternal"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
  }
  security_rule {
    name                       = "AllowOutboundInternal"
    priority                   = 101
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
  }

  security_rule {
    name                       = "DenyDirectAccessFromtheInternet"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "Internet"
    destination_address_prefix = "VirtualNetwork"
  }

  tags = {
    project = var.project
  }
}

# Network Interface
resource "azurerm_network_interface" "main" {
  count               = var.vm_count
  name                = "${var.project}-nic-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "${var.project}-ipconfig"
    subnet_id                     = azurerm_subnet.main.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    project = var.project
  }
}

# Public IP
resource "azurerm_public_ip" "main" {
    name                = "${var.project}-public-ip"
    location            = var.location
    resource_group_name = var.resource_group
    allocation_method   = "Static"
    tags = {
        project = var.project
    }
}
