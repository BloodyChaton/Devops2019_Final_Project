
resource "azurerm_subnet" "myterraformsubnet" {
  name                 = var.subvn[0]
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.myterraformnetwork.name
  address_prefixes     = [var.private_adress_subvn[1]]
  #network_security_group_id = azurerm_network_security_group.myterraformnsg.id
}

# Create public IPs 
resource "azurerm_public_ip" "myterraformpublicip" {
  name                = var.ips[0]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  domain_name_label   = var.DNS
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "myterraformnsg" {
  name                = var.NSG[0]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "HTTP"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = var.private_adress_subvn[1]
  }

  security_rule {
    name                       = "SSH"
    priority                   = 1010
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = var.private_adress_subvn[1]
  }

  security_rule {
    name                       = "Jenkins"
    priority                   = 1020
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = var.private_adress_subvn[0]
  }

  security_rule {
    name                       = "Nexus"
    priority                   = 1030
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8081"
    source_address_prefix      = "*"
    destination_address_prefix = var.private_adress_subvn[0]
  }

  tags = {
    environment = "dev"
  }
}

# Associate Network Security Rule to Subnet
resource "azurerm_subnet_network_security_group_association" "associate" {
  subnet_id                 = azurerm_subnet.myterraformsubnet.id
  network_security_group_id = azurerm_network_security_group.myterraformnsg.id
}
