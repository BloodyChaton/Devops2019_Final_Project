resource "google_compute_instance" "client" {
  name         = "${var.admin_name}"
  machine_type = "n1-standard-1"
  zone         = "${var.zone}"

  tags = ["admin"]

  boot_disk {
    initialize_params {
      image = "centos-7"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = "${google_compute_network.my-network.name}"
    subnetwork    = "${google_compute_subnetwork.admin.name}"
    network_ip    = "${var.admin_network}"
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
      image = "centos-7"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = "${google_compute_network.my-network.name}"
    subnetwork    = "${google_compute_subnetwork.mongodb.name}"
    network_ip    = "${var.mongodb_subnetwork}"
    access_config = {
    }
  }
}