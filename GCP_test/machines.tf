resource "google_compute_instance" "client" {
  name         = "${var.admin_name}"
  machine_type = "n1-standard-1"
  zone         = "${var.zone}"

  tags = ["admin"]

  boot_disk {
    initialize_params {
      image = "ubuntu-1804-lts"
    }
  }

  metadata {
    sshKeys="${var.sshKeys_user}:${file("~/.ssh/id_rsa.pub")}"
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = "${google_compute_network.my-network.name}"
    subnetwork    = "${google_compute_subnetwork.admin.name}"
    network_ip    = "${var.admin_adress}"
    access_config = {
    }
  }
}


resource "google_compute_instance" "db" {
  name         = "${var.mongodb_name}"
  machine_type = "n1-standard-1"
  zone         = "${var.zone}"

  tags = ["admin"]

  boot_disk {
    initialize_params {
      image = "ubuntu-1804-lts"
    }
  }

  metadata {
    sshKeys="${var.sshKeys_user}:${file("~/.ssh/id_rsa.pub")}"
  }
  
  network_interface {
    # A default network is created for all GCP projects
    network       = "${google_compute_network.my-network.name}"
    subnetwork    = "${google_compute_subnetwork.mongodb.name}"
    network_ip    = "${var.mongodb_adress}"
    access_config = {
    }
  }
}
resource "google_compute_project_metadata_item" "oslogin" {
  key     = "enable-oslogin"
  value   = "TRUE"
}
