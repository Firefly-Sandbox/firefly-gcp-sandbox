# The code was generated for this provider version (it can be changed to your preference). 

# The region is based on the first chosen resource (detected multiple regions). 
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.47.0"
    }
  }
}

provider "google" {
}


resource "google_compute_firewall" "acme-prod-firewall-3ee" {
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  disabled      = false
  name          = "acme-prod-firewall"
  network       = "https://www.googleapis.com/compute/v1/projects/acme-gcp-prod/global/networks/acme-prod-vpc"
  project       = "acme-gcp-prod"
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_instance_group_manager" "acme-prod-e96" {
  base_instance_name             = "acme-prod"
  list_managed_instances_results = "PAGELESS"
  name                           = "acme-prod"
  project                        = "acme-gcp-prod"
  target_size                    = 1
  update_policy {
    max_surge_fixed       = 1
    max_unavailable_fixed = 1
    minimal_action        = "REPLACE"
    replacement_method    = "SUBSTITUTE"
    type                  = "OPPORTUNISTIC"
  }
  version {
    instance_template = "https://www.googleapis.com/compute/v1/projects/acme-gcp-prod/regions/us-central1/instanceTemplates/acme-prod-instance-template"
  }
  zone = "us-central1-c"
}

resource "google_compute_firewall" "default-allow-http-9eb" {
  allow {
    ports    = ["80"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  disabled      = false
  name          = "default-allow-http"
  network       = "${google_compute_network.default-43e.self_link}"
  project       = "acme-gcp-prod"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}

resource "google_compute_network" "default-43e" {
  description              = "Default network for the project"
  enable_ula_internal_ipv6 = false
  name                     = "default"
  project                  = "acme-gcp-prod"
  routing_mode             = "REGIONAL"
}

resource "google_compute_firewall" "default-allow-https-4ba" {
  allow {
    ports    = ["443"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  disabled      = false
  name          = "default-allow-https"
  network       = "${google_compute_network.default-43e.self_link}"
  project       = "acme-gcp-prod"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["https-server"]
}

resource "google_compute_instance" "acme-prod-compute-spare-451" {
  boot_disk {
    device_name = "acme-prod-compute-spare"
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-12-bookworm-v20240213"
      size  = 10
      type  = "pd-balanced"
    }
    source = "https://www.googleapis.com/compute/v1/projects/acme-gcp-prod/zones/us-central1-a/disks/acme-prod-compute-spare"
  }
  confidential_instance_config {
    enable_confidential_compute = false
  }
  enable_display = false
  machine_type   = "e2-micro"
  name           = "acme-prod-compute-spare"
  network_interface {
    access_config {
      nat_ip       = "34.28.244.196"
      network_tier = "PREMIUM"
    }
    network            = "${google_compute_network.default-43e.self_link}"
    network_ip         = "10.128.0.3"
    stack_type         = "IPV4_ONLY"
    subnetwork         = "${google_compute_subnetwork.default-897.self_link}"
    subnetwork_project = "acme-gcp-prod"
  }
  project = "acme-gcp-prod"
  reservation_affinity {
    type = "ANY_RESERVATION"
  }
  scheduling {
    on_host_maintenance = "MIGRATE"
    provisioning_model  = "STANDARD"
  }
  service_account {
    email  = "248526912505-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }
  zone = "us-central1-a"
}

resource "google_compute_subnetwork" "default-897" {
  ip_cidr_range              = "10.128.0.0/20"
  name                       = "default"
  network                    = "https://www.googleapis.com/compute/v1/projects/acme-gcp-prod/global/networks/default"
  private_ip_google_access   = false
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  project                    = "acme-gcp-prod"
  purpose                    = "PRIVATE"
  region                     = "us-central1"
  stack_type                 = "IPV4_ONLY"
}

resource "google_compute_network" "acme-prod-vpc-ce8" {
  auto_create_subnetworks  = false
  enable_ula_internal_ipv6 = false
  mtu                      = 1460
  name                     = "acme-prod-vpc"
  project                  = "acme-gcp-prod"
  routing_mode             = "REGIONAL"
}

resource "google_storage_bucket" "acme-prod-storage-6b6" {
  default_event_based_hold    = false
  location                    = "US"
  name                        = "acme-prod-storage"
  project                     = "acme-gcp-prod"
  requester_pays              = false
  uniform_bucket_level_access = false
}

resource "google_compute_instance" "acme-prod-compute-7d5" {
  attached_disk {
    device_name = "acme-prod-disk"
    source      = "https://www.googleapis.com/compute/v1/projects/acme-gcp-prod/zones/us-central1-a/disks/acme-prod-disk"
  }
  boot_disk {
    device_name = "acme-prod-compute"
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-12-bookworm-v20240213"
      size  = 10
      type  = "pd-balanced"
    }
    source = "https://www.googleapis.com/compute/v1/projects/acme-gcp-prod/zones/us-central1-a/disks/acme-prod-compute"
  }
  confidential_instance_config {
    enable_confidential_compute = false
  }
  enable_display = false
  machine_type   = "e2-micro"
  name           = "acme-prod-compute"
  network_interface {
    access_config {
      nat_ip       = "34.31.115.115"
      network_tier = "PREMIUM"
    }
    network            = "${google_compute_network.default-43e.self_link}"
    network_ip         = "10.128.0.2"
    stack_type         = "IPV4_ONLY"
    subnetwork         = "${google_compute_subnetwork.default-897.self_link}"
    subnetwork_project = "acme-gcp-prod"
  }
  project = "acme-gcp-prod"
  reservation_affinity {
    type = "ANY_RESERVATION"
  }
  scheduling {
    on_host_maintenance = "MIGRATE"
    provisioning_model  = "STANDARD"
  }
  service_account {
    email  = "248526912505-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }
  tags = ["http-server", "https-server"]
  zone = "us-central1-a"
}

