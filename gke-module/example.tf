module "example" {
  source = "PUT-MODULE-PATH-HERE"

  routing_mode             = "REGIONAL"
  name-9bf4                = "acme-dev-vpc"
  enable_ula_internal_ipv6 = false
  name                     = "dev-gkc-cluster-1"
  region                   = "us-east1"
  mtu                      = "1460"
  location                 = "us-east1"
  auto_create_subnetworks  = false
  networking_mode          = "VPC_NATIVE"
  project                  = "acme-gcp-prod"
}

