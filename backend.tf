terraform {
  backend "gcs" {
    bucket  = "firefly_gcp_sandbox_tfstate"
    prefix  = "firefly-gcp-sandbox/state"
  }
}