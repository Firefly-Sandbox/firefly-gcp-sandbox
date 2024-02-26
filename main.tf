module "three-tier-web-app" {
  source  = "GoogleCloudPlatform/three-tier-web-app/google"
  version = "0.1.8"
  project_id  = "acme-gcp-prod"
  region = "us-east1"
  zone = "us-east1-c"
}
