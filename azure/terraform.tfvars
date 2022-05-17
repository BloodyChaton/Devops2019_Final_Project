server = ["westus"]

resourceG = "infraci"

vn = ["myVNetWUS"]

private_adress_vn = ["10.0.0.0/27"]

private_adress_subvn = ["10.0.0.0/28", "10.0.0.16/29", "10.0.0.24/29"]

subvn = ["mySubnetWUS", "mySubnetWUS-2"]

ips = ["adminIP"]

PrivateIP = ["10.0.0.10", "10.0.0.11", "10.0.0.12", "10.0.0.20"]

NSG = ["myNetworkSecurityGroupWUS", "myNetworkSecurityGroupWUS-2"]

NIC = ["myNICWUS", "myNICWUS-2"]

NIConfig = ["myNicConfigurationWUS", "myNicConfigurationWUS-2", "myNicConfigurationWUS-3"]

VM = ["jenkins", "slave", "nexus", "admin"]

useradmin = "azureuser"

nametag = ["jenkins", "maven", "nexus", "admin"]

DNS = "admin-projetci"
