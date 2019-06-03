server = ["westus","eastus","northeurope"]

resourceG = "infraci"

vn = ["myVNetWUS", "myVNetEUS", "myVNetNE"]

private_adress_vn = ["10.0.0.0/27"]

private_adress_subvn =["10.0.0.0/28","10.0.0.16/29", "10.0.0.24/29"]

subvn = ["mySubnetWUS","mySubnetWUS-2", "mySubnetWUS-3"]

ips = ["adminIP","myPublicIPEUS", "myPublicIPsNE"]

PrivateIP = ["10.0.0.10","10.0.0.11","10.0.0.12", "10.0.0.20"]

NSG = ["myNetworkSecurityGroupWUS","myNetworkSecurityGroupWUS-2","myNetworkSecurityGroupWUS-3"]

NIC = ["myNICWUS", "myNICWUS-2", "myNICWUS-3"]

NIConfig = ["myNicConfigurationWUS", "myNicConfigurationWUS-2","myNicConfigurationWUS-3"]

VM = ["admin-projetci","jenkinssubnw", "nexus"]

useradmin = "azureuser"

sshkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCym+NouF8g0DKCnFhRX6qHBVYXyaTyiPZkwL33Hr4GrYFREP4cDeTNnklIeRwXfXdgOjF5QBnMGQIKe6pki/CoulTkElz62rCOKPVmMYuudTEMmBN7eYOihDPP4Q9BrmDTakwwMpTTNxiPwpjPZaeU8UUVwKQWYDngSOX40oLW68A6oe4QGkbi2j9XqF/HbOuq7dwQV49ZPwZXiIiK0W/NZjyd7vBqUZlifwHJoVxOVhi7zjxUlHESg1qGkWWboiBnXi1a3nq/MOHlGxGdVlhQiWS+zefZsm9ZlpTSUNEuJTOaL874HcF9DtFVl3zCKeAhMzLFp5RpOJkr0taWLAgN user01@localhost.localdomain"

nametag = ["jenkins","maven", "nexus","admin"]
