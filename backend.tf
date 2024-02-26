terraform {
  backend "gcs" {
    bucket  = "acme-terraform-state"
    prefix  = "acme-gcp-prod/state"
  }
}
