resource "google_container_cluster" "dev-gkc-cluster-1-43e" {
  addons_config {
    gce_persistent_disk_csi_driver_config {
      enabled = true
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
    http_load_balancing {
      disabled = false
    }
  }
  cluster_autoscaling {
    auto_provisioning_defaults {
      management {
        auto_repair  = true
        auto_upgrade = true
      }
      oauth_scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
      upgrade_settings {
        max_surge = 1
        strategy  = "SURGE"
      }
    }
  }
  database_encryption {
    state = "DECRYPTED"
  }
  datapath_provider = "ADVANCED_DATAPATH"
  default_snat_status {
    disabled = false
  }
  dns_config {
    cluster_dns        = "CLOUD_DNS"
    cluster_dns_domain = "cluster.local"
    cluster_dns_scope  = "CLUSTER_SCOPE"
  }
  enable_autopilot         = true
  enable_l4_ilb_subsetting = false
  enable_tpu               = false
  gateway_api_config {
    channel = "CHANNEL_STANDARD"
  }
  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "192.168.0.0/16"
    services_ipv4_cidr_block = "10.0.0.0/16"
  }
  location = "us-east1"
  logging_config {
    enable_components = ["SYSTEM_COMPONENTS", "WORKLOADS"]
  }
  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }
  monitoring_config {
    enable_components = ["SYSTEM_COMPONENTS"]
    managed_prometheus {
      enabled = true
    }
  }
  name            = "dev-gkc-cluster-2"
  network         = "${google_compute_network.acme-dev-vpc-9hf.id}"
  networking_mode = "VPC_NATIVE"
  node_locations  = ["us-east1-b", "us-east1-c", "us-east1-d"]
  node_pool_defaults {
    node_config_defaults {
      logging_variant = "DEFAULT"
    }
  }
  node_version = "1.29.1-gke.1589018"
    min_master_version = "1.29.1-gke.1589018"
  notification_config {
    pubsub {
      enabled = false
    }
  }
  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = true
    master_global_access_config {
      enabled = true
    }
    master_ipv4_cidr_block = "172.16.0.0/28"
  }
  project = "acme-gcp-prod"
  release_channel {
    channel = "REGULAR"
  }
  service_external_ips_config {
    enabled = false
  }
  subnetwork = "${google_compute_subnetwork.acme-dev-net1-752.id}"
  vertical_pod_autoscaling {
    enabled = true
  }

}

resource "google_compute_network" "acme-dev-vpc-9hf" {
  auto_create_subnetworks  = false
  enable_ula_internal_ipv6 = false
  mtu                      = 1460
  name                     = "acme-dev-vpc2"
  project                  = "acme-gcp-prod"
  routing_mode             = "REGIONAL"
}

resource "google_compute_subnetwork" "acme-dev-net1-752" {
  ip_cidr_range              = "10.10.1.0/24"
  name                       = "acme-dev-net12"
  network                    = "${google_compute_network.acme-dev-vpc-9hf.id}"
  private_ip_google_access   = true
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  project                    = "acme-gcp-prod"
  purpose                    = "PRIVATE"
  region                     = "us-east1"
  stack_type = "IPV4_ONLY"
}



