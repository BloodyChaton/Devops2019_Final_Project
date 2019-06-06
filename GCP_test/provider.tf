provider "google" {
  credentials = "${file("united-lane-241907-c7fa43cedef5.json")}"
  project     = "${var.project}"
  region      = "${var.region}"
}

terraform {
  backend "artifactory" {
    # URL of the nexus repository
    url      = "http://admin-projetci.westus.cloudapp.azure.com/nexus/repository/terraform/" 
    # the repository name you just created
    repo     = "terraform" 
    # an unique path to for identification
    subpath  = "projetci"
    # an username that has permissions to the repository
    username = "admin" 
    # the password of the username you provided
    password = "admin123" 
  }
}

resource "google_compute_firewall" "admin" {
  name    = "${var.admin_firewall}"
  network = "${google_compute_network.my-network.name}"

  allow {
    protocol = "tcp"
    ports    = ["8080", "22", "80", "27017"]
  }
  target_tags = ["admin"]
}

resource "google_compute_router" "vpc-router" {
  name    = "${google_compute_network.my-network.name}-router"
  region  = "${var.region}"
  network = "${google_compute_network.my-network.self_link}"
  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "vpc-nat" {
  name                               = "${google_compute_network.my-network.name}-nat"
  router                             = "${google_compute_router.vpc-router.name}"
  region                             = "${var.region}"
  nat_ip_allocate_option             = "AUTO_ONLY"
  //nat_ips                            = ["${google_compute_address.vpc-address.self_link}"]
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}


resource "google_compute_project_metadata_item" "ssh-keys" {
  key   = "${var.ssh_keys}"
  value = "${var.ssh_user}:${var.public_key}"
}

resource "google_compute_subnetwork" "admin" {
  name          = "${var.admin_subnetwork_name}"
  ip_cidr_range = "${var.admin_subnetwork}"
  region        = "${var.region}"
  network       = "${google_compute_network.my-network.self_link}"
}

resource "google_compute_subnetwork" "mongodb" {
  name          = "${var.mongodb_subnetwork_name}"
  ip_cidr_range = "${var.mongodb_subnetwork}"
  region        = "${var.region}"
  network       = "${google_compute_network.my-network.self_link}"
}

resource "google_compute_subnetwork" "kube" {
  name          = "${var.kube_subnetwork_name}"
  ip_cidr_range = "${var.kube_subnetwork_pod}"
  region        = "${var.region}"
  network       = "${google_compute_network.my-network.self_link}"
  secondary_ip_range {
    range_name    = "${var.kube_subnetwork_node_name}"
    ip_cidr_range = "${var.kube_subnetwork_node}"
  }
  secondary_ip_range {
    range_name    = "${var.kube_subnetwork_serv_name}"
    ip_cidr_range = "${var.kube_subnetwork_service}"
  }
}

resource "google_compute_network" "my-network" {
  provider = "google"
  name = "${var.project_name}"
  auto_create_subnetworks = "false"
}


