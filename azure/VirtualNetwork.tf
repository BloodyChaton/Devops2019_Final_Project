provider "azurerm" {}

resource "azurerm_resource_group" "rg" {
  name     = var.resourceG
  location = var.server[0]
}

resource "azurerm_virtual_network" "myterraformnetwork" {
  name                = var.vn[0]
  address_space       = ["${var.private_adress_vn[0]}"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
