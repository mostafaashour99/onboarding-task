resource "google_service_account" "bqwriter" {
  account_id = "bqwriter"
}

resource "google_project_iam_member" "bqwriter-iam" {
  project = var.project_id
  role    = "roles/bigquery.dataEditor"
  member = "serviceAccount:${google_service_account.bqwriter.email}"
}

resource "google_bigquery_dataset" "dataset" {
  for_each = var.dataset_name
  dataset_id                  = each.key
  friendly_name               = each.value
  location                    = var.region
  default_table_expiration_ms = 3600000

  # labels = {
  #   env = "default"
  # }
  # access {
  #   role          = "OWNER"
  #   user_by_email = google_service_account.bqowner.email
  # }

  # access {
  #   role          = "WRITER"
  #   user_by_email = google_service_account.bqwriter.email
  # }

}

# resource "google_service_account" "bqowner" {
#   account_id = "bqowner"
# }

