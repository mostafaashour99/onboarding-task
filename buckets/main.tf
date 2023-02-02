resource "google_service_account" "buckets-sa" {
  account_id = var.buckets-sa-id 
}

resource "google_project_iam_member" "buckets-iam" {
  project = var.project_id
  role    = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.buckets-sa.email}"
}

resource "google_storage_bucket" "gs" {
 
  for_each = toset(var.gs-name)
  name = each.value
  location      = var.gs-location
  storage_class = var.gs-storage-class
 # public_access_prevention = "enforced"
}