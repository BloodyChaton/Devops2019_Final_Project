resource "google_container_cluster" "primary" {
  name     = "${var.kube_cluster_name}"
  location = "${var.zone}"
  network  = "${google_compute_network.my-network.name}"
  subnetwork  = "${google_compute_subnetwork.kube.name}"
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count = 2

  # Setting an empty username and password explicitly disables basic auth
  master_auth {
    username = "adminl"
    password = "BOURNE02-08-1984"
  }

  master_authorized_networks_config {
    cidr_blocks = [
        { cidr_block = "${var.master_ip}", display_name = "acces-admin" }
    ]
  }
  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes = true
    master_ipv4_cidr_block = "${var.master_ipv4_cidr}"
  }
  ip_allocation_policy{
    cluster_secondary_range_name = "${var.kube_subnetwork_node_name}"
    services_secondary_range_name = "${var.kube_subnetwork_serv_name}"
  }
}

resource "google_container_node_pool" "machine1" {
  name       = "${var.kube_node_pool_1}"
  location   = "${var.zone}"
  cluster    = "${google_container_cluster.primary.name}"
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"

    metadata {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

resource "google_container_node_pool" "machine2" {
  name       = "${var.kube_node_pool_2}"
  location   = "${var.zone}"
  cluster    = "${google_container_cluster.primary.name}"
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"

    metadata {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}



# The following outputs allow authentication and connectivity to the GKE Cluster
# by using certificate-based authentication.
output "client_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.client_certificate}"
}

output "client_key" {
  value = "${google_container_cluster.primary.master_auth.0.client_key}"
}

output "cluster_ca_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.cluster_ca_certificate}"
}
