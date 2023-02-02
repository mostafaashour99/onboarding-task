resource "google_service_account" "kubernetes" {
  account_id = "kubernetes"
}

resource "google_project_iam_member" "kubernetes-iam" {
  project = var.project_id
  role    = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.kubernetes.email}"
}
resource "google_container_node_pool" "general" {
  name       = "general"
  cluster    = google_container_cluster.primary.name
  node_count = 1
  location = google_container_cluster.primary.location
  node_locations = var.node_locations

  management {
    auto_repair  = true
    auto_upgrade = true
  }
#    autoscaling {
#     max_node_count = 1
#     min_node_count = 1
#   }

#   upgrade_settings {
#     max_surge       = 1
#     max_unavailable = 1
#   }
  
  
  node_config {
    preemptible  = true
    machine_type = var.node_type
    disk_size_gb = 100

    service_account = google_service_account.kubernetes.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
