variable "server" {
  type = list(any)
}

variable "resourceG" {
  type = string
}

variable "vn" {
  type = list(any)
}

variable "private_adress_vn" {
  type = list(any)
}

variable "PrivateIP" {
  type = list(any)
}

variable "subvn" {
  type = list(any)
}
variable "private_adress_subvn" {
  type = list(any)
}
variable "ips" {
  type = list(any)
}

variable "NSG" {
  type = list(any)
}

variable "NIC" {
  type = list(any)
}

variable "NIConfig" {
  type = list(any)
}

variable "VM" {
  type = list(any)
}

# variable "sshkey" {
#     type= string
# }

variable "useradmin" {
  type = string
}

variable "nametag" {
  type = list(any)
}

variable "DNS" {
  type = string
}
