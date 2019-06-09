server = ["centralus"]

resourceG = "infraci2"

vn = ["myVNetCUS"]

private_adress_vn = ["10.0.0.0/27"]

private_adress_subvn =["10.0.0.0/28","10.0.0.16/29", "10.0.0.24/29"]

subvn = ["mySubnetCUS","mySubnetCUS-2"]

ips = ["adminIP"]

PrivateIP = ["10.0.0.10","10.0.0.11","10.0.0.12", "10.0.0.20"]

NSG = ["myNetworkSecurityGroupCUS","myNetworkSecurityGroupCUS-2"]

NIC = ["myNICCUS", "myNICCUS-2"]

NIConfig = ["myNicConfigurationCUS", "myNicConfigurationCUS-2","myNicConfigurationCUS-3"]

VM = ["jenkins","slave", "nexus", "admin"]

useradmin = "azureuser"

nametag = ["jenkins","maven", "nexus","admin"]

DNS = "admin-projetci2"
