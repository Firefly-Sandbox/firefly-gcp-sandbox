resource "google_compute_firewall" "gke-dev-gkc-cluster-2-6690049d-all-294" {
  allow {
    protocol = "ah"
  }
  allow {
    protocol = "esp"
  }
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "sctp"
  }
  allow {
    protocol = "tcp"
  }
  allow {
    protocol = "udp"
  }
  direction     = "INGRESS"
  disabled      = false
  name          = "gke-dev-gkc-cluster-2-6690049d-all"
  network       = "https://www.googleapis.com/compute/v1/projects/acme-gcp-prod/global/networks/acme-dev-vpc2"
  project       = "acme-gcp-prod"
  source_ranges = ["192.168.0.0/16"]
  target_tags   = ["gke-dev-gkc-cluster-2-6690049d-node"]
}


resource "google_compute_firewall" "gke-dev-gkc-cluster-2-6690049d-inkubelet-bf6" {
  allow {
    ports    = ["10255"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  disabled      = false
  name          = "gke-dev-gkc-cluster-2-6690049d-inkubelet"
  network       = "https://www.googleapis.com/compute/v1/projects/acme-gcp-prod/global/networks/acme-dev-vpc2"
  priority      = 999
  project       = "acme-gcp-prod"
  source_ranges = ["192.168.0.0/16"]
  source_tags   = ["gke-dev-gkc-cluster-2-6690049d-node"]
  target_tags   = ["gke-dev-gkc-cluster-2-6690049d-node"]
}


resource "google_compute_firewall" "gke-dev-gkc-cluster-2-6690049d-vms-253" {
  allow {
    ports    = ["1-65535"]
    protocol = "tcp"
  }
  allow {
    ports    = ["1-65535"]
    protocol = "udp"
  }
  allow {
    protocol = "icmp"
  }
  direction     = "INGRESS"
  disabled      = false
  name          = "gke-dev-gkc-cluster-2-6690049d-vms"
  network       = "https://www.googleapis.com/compute/v1/projects/acme-gcp-prod/global/networks/acme-dev-vpc2"
  project       = "acme-gcp-prod"
  source_ranges = ["10.10.1.0/24"]
  target_tags   = ["gke-dev-gkc-cluster-2-6690049d-node"]
}


resource "google_compute_firewall" "gke-dev-gkc-cluster-2-6690049d-exkubelet-be7" {
  deny {
    ports    = ["10255"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  disabled      = false
  name          = "gke-dev-gkc-cluster-2-6690049d-exkubelet"
  network       = "https://www.googleapis.com/compute/v1/projects/acme-gcp-prod/global/networks/acme-dev-vpc2"
  project       = "acme-gcp-prod"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["gke-dev-gkc-cluster-2-6690049d-node"]
}


resource "google_compute_network" "acme-dev-vpc2-bfa" {
  auto_create_subnetworks  = false
  enable_ula_internal_ipv6 = false
  mtu                      = 1460
  name                     = "acme-dev-vpc2"
  project                  = "acme-gcp-prod"
  routing_mode             = "REGIONAL"
}


resource "google_compute_firewall" "gke-dev-gkc-cluster-1-2c442ae6-master-bb9" {
  allow {
    ports    = ["10250", "443"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  disabled      = false
  name          = "gke-dev-gkc-cluster-1-2c442ae6-master"
  network       = "https://www.googleapis.com/compute/v1/projects/acme-gcp-prod/global/networks/acme-dev-vpc"
  project       = "acme-gcp-prod"
  source_ranges = ["172.16.0.0/28"]
  target_tags   = ["gke-dev-gkc-cluster-1-2c442ae6-node"]
}


resource "google_compute_firewall" "gke-dev-gkc-cluster-1-2c442ae6-exkubelet-9a9" {
  deny {
    ports    = ["10255"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  disabled      = false
  name          = "gke-dev-gkc-cluster-1-2c442ae6-exkubelet"
  network       = "https://www.googleapis.com/compute/v1/projects/acme-gcp-prod/global/networks/acme-dev-vpc"
  project       = "acme-gcp-prod"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["gke-dev-gkc-cluster-1-2c442ae6-node"]
}


resource "google_compute_firewall" "gke-dev-gkc-cluster-1-2c442ae6-all-ac4" {
  allow {
    protocol = "ah"
  }
  allow {
    protocol = "esp"
  }
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "sctp"
  }
  allow {
    protocol = "tcp"
  }
  allow {
    protocol = "udp"
  }
  direction     = "INGRESS"
  disabled      = false
  name          = "gke-dev-gkc-cluster-1-2c442ae6-all"
  network       = "https://www.googleapis.com/compute/v1/projects/acme-gcp-prod/global/networks/acme-dev-vpc"
  project       = "acme-gcp-prod"
  source_ranges = ["192.168.0.0/16"]
  target_tags   = ["gke-dev-gkc-cluster-1-2c442ae6-node"]
}


resource "google_compute_firewall" "gke-dev-gkc-cluster-1-2c442ae6-vms-984" {
  allow {
    ports    = ["1-65535"]
    protocol = "tcp"
  }
  allow {
    ports    = ["1-65535"]
    protocol = "udp"
  }
  allow {
    protocol = "icmp"
  }
  direction     = "INGRESS"
  disabled      = false
  name          = "gke-dev-gkc-cluster-1-2c442ae6-vms"
  network       = "https://www.googleapis.com/compute/v1/projects/acme-gcp-prod/global/networks/acme-dev-vpc"
  project       = "acme-gcp-prod"
  source_ranges = ["10.10.1.0/24"]
  target_tags   = ["gke-dev-gkc-cluster-1-2c442ae6-node"]
}


resource "google_compute_firewall" "gke-dev-gkc-cluster-1-2c442ae6-inkubelet-c22" {
  allow {
    ports    = ["10255"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  disabled      = false
  name          = "gke-dev-gkc-cluster-1-2c442ae6-inkubelet"
  network       = "https://www.googleapis.com/compute/v1/projects/acme-gcp-prod/global/networks/acme-dev-vpc"
  priority      = 999
  project       = "acme-gcp-prod"
  source_ranges = ["192.168.0.0/16"]
  source_tags   = ["gke-dev-gkc-cluster-1-2c442ae6-node"]
  target_tags   = ["gke-dev-gkc-cluster-1-2c442ae6-node"]
}


resource "google_compute_network" "acme-dev-vpc-9bf" {
  auto_create_subnetworks  = false
  enable_ula_internal_ipv6 = false
  mtu                      = 1460
  name                     = "acme-dev-vpc"
  project                  = "acme-gcp-prod"
  routing_mode             = "REGIONAL"
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


resource "google_compute_instance" "acme-prod-l1m8-e84" {
  boot_disk {
    device_name = "acme-prod-instance-template"
    source      = "https://www.googleapis.com/compute/v1/projects/acme-gcp-prod/zones/us-central1-c/disks/acme-prod-l1m8"
  }
  confidential_instance_config {
    enable_confidential_compute = false
  }
  enable_display = false
  machine_type   = "e2-micro"
  metadata = {
    created-by        = "projects/248526912505/zones/us-central1-c/instanceGroupManagers/acme-prod"
    instance-template = "projects/248526912505/regions/us-central1/instanceTemplates/acme-prod-instance-template"
  }
  name = "acme-prod-l1m8"
  network_interface {
    access_config {
      nat_ip       = "34.172.91.229"
      network_tier = "PREMIUM"
    }
    network            = "https://www.googleapis.com/compute/v1/projects/acme-gcp-prod/global/networks/default"
    network_ip         = "10.128.0.4"
    stack_type         = "IPV4_ONLY"
    subnetwork         = "https://www.googleapis.com/compute/v1/projects/acme-gcp-prod/regions/us-central1/subnetworks/default"
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
  zone = "us-central1-c"
}


resource "google_compute_instance_group_manager" "acme-prod-0ff" {
  base_instance_name             = "acme-prod"
  list_managed_instances_results = "PAGINATED"
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


resource "google_compute_firewall" "default-allow-https-4ba" {
  allow {
    ports    = ["443"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  disabled      = false
  name          = "default-allow-https"
  network       = "https://www.googleapis.com/compute/v1/projects/acme-gcp-prod/global/networks/default"
  project       = "acme-gcp-prod"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["https-server"]
}


resource "google_compute_instance" "acme-prod-compute-spare-975" {
  boot_disk {
    device_name = "acme-prod-compute-spare"
    source      = "https://www.googleapis.com/compute/v1/projects/acme-gcp-prod/zones/us-central1-a/disks/acme-prod-compute-spare"
  }
  confidential_instance_config {
    enable_confidential_compute = false
  }
  enable_display = false
  machine_type   = "e2-micro"
  name           = "acme-prod-compute-spare"
  network_interface {
    access_config {
      nat_ip       = "35.209.243.166"
      network_tier = "STANDARD"
    }
    network            = "https://www.googleapis.com/compute/v1/projects/acme-gcp-prod/global/networks/default"
    network_ip         = "10.128.0.3"
    stack_type         = "IPV4_ONLY"
    subnetwork         = "https://www.googleapis.com/compute/v1/projects/acme-gcp-prod/regions/us-central1/subnetworks/default"
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


resource "google_compute_network" "acme-prod-vpc-ce8" {
  auto_create_subnetworks  = false
  enable_ula_internal_ipv6 = false
  mtu                      = 1460
  name                     = "acme-prod-vpc"
  project                  = "acme-gcp-prod"
  routing_mode             = "REGIONAL"
}


resource "google_compute_address" "acme-prod-access-0ca" {
  address      = "34.72.72.116"
  name         = "acme-prod-access"
  network_tier = "PREMIUM"
  project      = "acme-gcp-prod"
  region       = "us-central1"
}


resource "google_storage_bucket" "acme-prod-storage-086" {
  default_event_based_hold    = false
  location                    = "US"
  name                        = "acme-prod-storage"
  project                     = "acme-gcp-prod"
  requester_pays              = false
  uniform_bucket_level_access = false
}


resource "google_compute_instance" "acme-prod-compute-8de" {
  attached_disk {
    device_name = "acme-prod-disk"
    source      = "https://www.googleapis.com/compute/v1/projects/acme-gcp-prod/zones/us-central1-a/disks/acme-prod-disk"
  }
  boot_disk {
    device_name = "acme-prod-compute"
    source      = "https://www.googleapis.com/compute/v1/projects/acme-gcp-prod/zones/us-central1-a/disks/acme-prod-compute"
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
    network            = "https://www.googleapis.com/compute/v1/projects/acme-gcp-prod/global/networks/default"
    network_ip         = "10.128.0.2"
    stack_type         = "IPV4_ONLY"
    subnetwork         = "https://www.googleapis.com/compute/v1/projects/acme-gcp-prod/regions/us-central1/subnetworks/default"
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


resource "google_storage_bucket" "acme-terraform-state-c0c" {
  default_event_based_hold    = false
  location                    = "US"
  name                        = "acme-terraform-state"
  project                     = "acme-gcp-prod"
  public_access_prevention    = "enforced"
  requester_pays              = false
  uniform_bucket_level_access = true
}

