resource "google_compute_network" "main" {
  name                            =  var.network_name
  auto_create_subnetworks         = false
  routing_mode = "REGIONAL"
}

resource "google_compute_subnetwork" "private-subnet" {
  name                     = var.subnet_name
  ip_cidr_range            = var.subnet_cidr
  region                   = var.region
  network                  = google_compute_network.main.id
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = var.pod-range-secondary_ip_range-name 
    ip_cidr_range = var.pod-range-secondary_ip_range 
  }
  secondary_ip_range {
    range_name    = var.service-range-secondary_ip_range-name
    ip_cidr_range = var.service-range-secondary_ip_range
  }
}

resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  target_tags = ["bastion"]
  source_ranges = ["35.235.240.0/20"]
}

