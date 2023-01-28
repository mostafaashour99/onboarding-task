resource "google_service_account" "default"{
  account_id   = "expanded-run-375112"
  display_name = "Service Account"
}

resource "google_compute_instance" "bastion" {
  name         = var.vm-name
  machine_type = var.vm-type
  zone         = var.vm-zone
  tags = ["bastion"]
  boot_disk {
    initialize_params {
      image = var.os-image
    }
  }

  network_interface {
    network = var.network_name
    subnetwork = var.subnet_name
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}