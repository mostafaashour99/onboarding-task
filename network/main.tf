resource "google_compute_network" "main" {
  name                            =  var.network_name
  routing_mode                    = "GLOBAL"
  auto_create_subnetworks         = false
  #delete_default_routes_on_create = true
}

resource "google_compute_subnetwork" "private-subnet" {
  name                     = var.network_name
  ip_cidr_range            = var.subnet_cidr
  region                   = var.region
  network                  = google_compute_network.main.id
  private_ip_google_access = true

#   secondary_ip_range {
#     range_name    = "k8s-pod-range"
#     ip_cidr_range = "10.48.0.0/14"
#   }
#   secondary_ip_range {
#     range_name    = "k8s-service-range"
#     ip_cidr_range = "10.52.0.0/20"
#   }
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

# resource "google_compute_route" "egress_internet" {
#   name             = "egress-internet"
#   dest_range       = "0.0.0.0/0"
#   network          = google_compute_network.main.name
#   next_hop_gateway = "default-internet-gateway"
# }