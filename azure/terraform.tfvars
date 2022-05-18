server = ["northeurope"]

resourceG = "infraci"

vn = ["myVNetNUE"]

private_adress_vn = ["10.0.0.0/27"]

private_adress_subvn = ["10.0.0.0/28", "10.0.0.16/29", "10.0.0.24/29"]

subvn = ["mySubnetNUE", "mySubnetNUE-2"]

ips = ["adminIP"]

PrivateIP = ["10.0.0.10", "10.0.0.11", "10.0.0.12", "10.0.0.20"]

NSG = ["myNetworkSecurityGroupNUE", "myNetworkSecurityGroupNUE-2"]

NIC = ["myNICNUE", "myNICNUE-2"]

NIConfig = ["myNicConfigurationNUE", "myNicConfigurationNUE-2", "myNicConfigurationNUE-3"]

VM = ["jenkins", "slave", "nexus", "admin"]

useradmin = "azureuser"

nametag = ["jenkins", "maven", "nexus", "admin"]

DNS = "admin-projetci"
