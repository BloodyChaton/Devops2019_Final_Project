resource "azurerm_subnet" "myterraformsubnet2" {
  name                      = var.subvn[1]
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.myterraformnetwork.name
  address_prefix            = var.private_adress_subvn[0]
  network_security_group_id = azurerm_network_security_group.myterraformnsg2.id
}

# Create public IPs 
# resource "azurerm_public_ip" "myterraformpublicip" {
#   name                = "${var.ips[0]}"
#   location            = "${azurerm_resource_group.rg.location}"
#   resource_group_name = "${azurerm_resource_group.rg.name}"
#   allocation_method   = "Static"
#   # domain_name_label = "${var.VM[0]}"
# }

# Create Network Security Group and rule
resource "azurerm_network_security_group" "myterraformnsg2" {
  name                = var.NSG[1]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "HTTP2"
    priority                   = 1100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = var.private_adress_subvn[1]
    destination_address_prefix = var.private_adress_subvn[0]
  }
  security_rule {
    name                       = "HTTP3"
    priority                   = 1101
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = var.private_adress_subvn[0]
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "HTTP4"
    priority                   = 1102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8081"
    source_address_prefix      = "*"
    destination_address_prefix = var.private_adress_subvn[0]
  }

  security_rule {
    name                       = "HTTP5"
    priority                   = 1103
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "8081"
    destination_port_range     = "*"
    source_address_prefix      = var.private_adress_subvn[0]
    destination_address_prefix = "*"
  }


  security_rule {
    name                       = "SSH"
    priority                   = 1110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = var.private_adress_subvn[0]
  }

  security_rule {
    name                       = "HTTP-o"
    priority                   = 1120
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = var.private_adress_subvn[0]
    destination_address_prefix = "*"
  }

  tags {
    environment = "dev"
  }
}

# Associate Network Security Rule to Subnet
resource "azurerm_subnet_network_security_group_association" "associate2" {
  subnet_id                 = azurerm_subnet.myterraformsubnet2.id
  network_security_group_id = azurerm_network_security_group.myterraformnsg2.id
}