variable "project" {
  default = "united-lane-241907"
} 

variable "region" {
  default = "europe-north1"
} 

variable "zone" {
  default = "europe-north1-a"
} 

variable "admin_name" {
  default = "production-client"
} 

variable "mongodb_name" {
  default = "production-db"
} 

variable "admin_firewall" {
  default = "production-admin-firewall"
} 

variable "admin_subnetwork_name" {
  default = "production-admin-subnetwork"
}

variable "mongodb_subnetwork_name" {
  default = "production-mongodb-subnetwork"
}

variable "kube_subnetwork_name" {
  default = "prod-kube-subnetwork-pod"
}

variable "kube_subnetwork_node_name" {
  default = "prod-kube-subnetwork-node"
}

variable "kube_subnetwork_serv_name" {
  default = "prod-kube-subnetwork-serv"
}

variable "kube_cluster_name" {
  default = "prod-cluster"
}

variable "kube_node_pool_1" {
  default = "prod-pool-1"
}

variable "kube_node_pool_2" {
  default = "prod-pool-2"
}

variable "project_name" {
  default = "production"
}
variable "master_ip" {
  default = "10.5.0.0/24"
} 

variable "master_ipv4_cidr" {
  default = "10.15.0.0/28" 
} 

variable "admin_network" {
  default = "10.5.0.10"
} 

variable "admin_subnetwork" {
  default = "10.5.0.0/21"
} 

variable "kube_subnetwork_pod" {
  default = "10.6.0.0/21"
} 

variable "kube_subnetwork_node" {
  default = "10.7.0.0/21"
} 

variable "kube_subnetwork_service" {
  default = "10.8.0.0/21"
} 

variable "mongodb_adress" {
  default = "10.9.0.10"
} 

variable "mongodb_subnetwork" {
  default = "10.9.0.0/21"
} 

variable "ssh_keys" {
  default = "production-ssh-key"
}

variable "public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC25G/wnpjYHounebrOuLmEjrb3FSpXCTUDATuBXfISLeg4LYUdl6Xdf5gEpnC4tu1vrWJ8Kx8OtJbcErKcaN6fa8x0M8O5C3xyuaAcnjc4wZsJExXZTLE7cuJrdVmtdrn6slA+bYzyecFb35h8S6gO1uyNGNgjbkwdPU/khKzqwHd2gbxg56NNQFMFGwlLV2Lp9BubGD+ksMwUS9G81c0F6qEgdJ3bPfOql03qEwA+HeMdBWlXaA2lPpiV9i6MgbVNGLA6qeUL1sMp3jA5FdRq9SOxVO9fncz9Pbm04k8li0AtN7w/4lYtC0SzL8Y+5zirc32+ovCe9eFWde7Vz0M5 adminl@localhost.localdomain"
}

variable "ssh_user" {
  default = "adminl"
}