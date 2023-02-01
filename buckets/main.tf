resource "google_service_account" "buckets" {
  account_id = "buckets"
}

resource "google_project_iam_member" "buckets-iam" {
  project = var.project_id
  role    = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.buckets.email}"
}

resource "google_storage_bucket" "gs" {
  name          = var.gs-name
  location      = var.gs-location
  storage_class = var.gs-storage-class
 # public_access_prevention = "enforced"
}