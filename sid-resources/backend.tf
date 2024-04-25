terraform {
  backend "gcs" {
    bucket  = "acme-terraform-state"
    prefix  = "acme-gcp-prod/sid-state"
  }
}
