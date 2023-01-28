output "network" {
  value       = google_compute_network.main
}

output "private-subnet" {
  value       = google_compute_subnetwork.private-subnet
}
