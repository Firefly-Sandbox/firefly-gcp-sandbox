# Example - VPC_NATIVE 
variable "networking_mode" {
  type        = string
  description = "(Optional) Determines whether alias IPs or routes will be used for pod IPs in the cluster. Options are `VPC_NATIVE` or `ROUTES`. `VPC_NATIVE` enables IP aliasing, and requires the `ip_allocation_policy` block to be defined. By default when this field is unspecified."
  default     = "VPC_NATIVE"

  validation {
    condition     = can(regex("^VPC_NATIVE|ROUTES$", var.networking_mode))
    error_message = "The networking_mode variable must be either set to 'VPC_NATIVE' or 'ROUTES'."
  }
}

# Example - us-east1 
variable "location" {
  type        = string
  description = "(Optional) The region in which the cluster master will be created."
  default     = null
}

# Example - acme-gcp-prod 
variable "project" {
  type        = string
  description = "(Optional) The ID of the project in which the resource belongs. If it is not set, the provider project is used."
  default     = null
}

# Example - dev-gkc-cluster-1 
variable "name" {
  type        = string
  description = "(Required) The name of the cluster."
}

# Example - us-east1 
variable "region" {
  type = any
}

# Example - REGIONAL 
variable "routing_mode" {
  description = "(Optional) The network-wide routing mode to use. If set to 'REGIONAL', this network's cloud routers will only advertise routes with subnetworks of this network in the same region as the router. If set to 'GLOBAL', this network's cloud routers will advertise routes with all subnetworks of this network, across regions. Possible values are 'REGIONAL' and 'GLOBAL'. Default is 'REGIONAL'."
  type        = string
  default     = "REGIONAL"

  validation {
    condition     = var.routing_mode != "REGIONAL" || var.routing_mode != "GLOBAL"
    error_message = "The vpc_routing_mode must be set to either 'REGIONAL' or 'GLOBAL'."
  }
}

# Example - false 
variable "auto_create_subnetworks" {
  description = "(Optional) When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the '10.128.0.0/9' address range. When set to 'false', the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources. Default is 'false'."
  type        = bool
  default     = false
}

# Example - acme-dev-vpc 
variable "name-9bf4" {
  description = "(Optional) The name of the VPC. The name will be used to prefix all associacted resources also. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression \"[a-z]([-a-z0-9]*[a-z0-9])?\" which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. Default is \"main\"."
  type        = string
  default     = "main"

  validation {
    condition     = can(regex("[a-z]([-a-z0-9]*[a-z0-9])?", var.name-9bf4)) && length(var.name-9bf4) >= 1 && length(var.name-9bf4) <= 64
    error_message = "The name must be 1-63 characters long and match the regular expression \"[a-z]([-a-z0-9]*[a-z0-9])?\" which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash."
  }
}

# Example - false 
variable "enable_ula_internal_ipv6" {
  description = "(Optional) Enable ULA internal ipv6 on this network. Enabling this feature will assign a /48 from google defined ULA prefix fd20::/20."
  type        = bool
  default     = false
}

# Example - 1460 
variable "mtu" {
  description = "(Optional) Maximum Transmission Unit in bytes. The minimum value for this field is 1460 and the maximum value is 1500 bytes. Default is '1460'."
  type        = string
  default     = 1460

  validation {
    condition     = var.mtu >= 1460 && var.mtu <= 1500
    error_message = "The mtu expects a value between '1460' and '1500'."
  }
}
