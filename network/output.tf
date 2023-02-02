output "network" {
  value       = google_compute_network.main
}

output "private-subnet" {
  value       = google_compute_subnetwork.private-subnet
}
output "pod-range-name" {
  value = var.pod-range-secondary_ip_range-name
}
output "service-range-name" {
  value = var.service-range-secondary_ip_range-name
}