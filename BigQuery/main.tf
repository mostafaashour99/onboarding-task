resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = "example_dataset"
  friendly_name               = var.dataset_name
  description                 = "This is a test description"
  location                    = "US"
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

resource "google_service_account" "bqwriter" {
  account_id = "bqwriter"
}

resource "google_project_iam_member" "bqwriter-iam" {
  project = var.project_id
  role    = "roles/bigquery.dataEditor"
  member = "serviceAccount:${google_service_account.bqwriter.email}"
}