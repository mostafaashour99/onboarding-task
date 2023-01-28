resource "google_storage_bucket" "gs" {
  name          = var.gs-name
  location      = var.gs-location
  storage_class = var.gs-storage-class
  public_access_prevention = "enforced"
}