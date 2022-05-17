
# Create network interface
resource "azurerm_network_interface" "myterraformnic2" {
  name                = "${var.NIC[1]}-${count.index}"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  network_security_group_id = "${azurerm_network_security_group.myterraformnsg2.id}"
  count               = 3
  ip_configuration {
    name                          = "${var.NIConfig[1]}-${count.index}"
    subnet_id                     = "${azurerm_subnet.myterraformsubnet2.id}"
    private_ip_address_allocation = "Static"
    private_ip_address            = "${var.PrivateIP["${count.index}"] }"
  }

  tags {
    environment = "dev"
  }
}

# # Generate random text for a unique storage account name
# resource "random_id" "randomId" {
#   keepers = {
#     # Generate a new ID only when a new resource group is defined
#     resource_group = "${azurerm_resource_group.rg.name}"
#   }

#   byte_length = 8
# }

# Create storage account for boot diagnostics
# resource "azurerm_storage_account" "mystorageaccount" {
#   name                     = "diag${random_id.randomId.hex}"
#   resource_group_name      = "${azurerm_resource_group.rg.name}"
#   location                 = "${azurerm_resource_group.rg.location}"
#   account_tier             = "Standard"
#   account_replication_type = "LRS"

#   tags {
#     environment = "dev"
#   }
# }

# Create virtual machine
resource "azurerm_virtual_machine" "myterraformvm2" {
  name                = "${var.VM["${count.index}"] }"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  network_interface_ids = ["${element(azurerm_network_interface.myterraformnic2.*.id, count.index)}"]
  vm_size               = "Standard_D2as_v5"
  count = 3

  storage_os_disk {
    name              = "${var.VM[1]}-osdisk-${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  storage_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "7_9-gen2"
    version   = "latest"
  }

  os_profile {
    computer_name  = "${var.VM[1]}-${count.index}"
    admin_username = "${var.useradmin}"
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
        path     = "/home/${var.useradmin}/.ssh/authorized_keys"
        key_data = "${file("~/.ssh/id_rsa.pub")}"
    }
  }

  boot_diagnostics {
    enabled     = "true"
    storage_uri = "${azurerm_storage_account.mystorageaccount.primary_blob_endpoint}"
  }

  tags {
    environment = "dev"
    name        = "${var.nametag["${count.index}"]}"
  }
}
