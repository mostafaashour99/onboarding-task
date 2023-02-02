resource "google_service_account" "bastion-sa"{
  account_id   = var.bastion-sa_id
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
    access_config {
      // Ephemeral IP
    }
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.bastion-sa.email
    scopes = ["cloud-platform"]
  }
}