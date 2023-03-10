resource "google_container_cluster" "primary" {
  name                     = var.cluster_name
  location                 = var.cluster_location
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = var.network_name
  subnetwork               = var.subnet_name
  addons_config {
    http_load_balancing {
      disabled = true
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
  }

  workload_identity_config {
    workload_pool = format("%s.svc.id.goog",var.project_id)
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = var.pod-range-name
    services_secondary_range_name = var.service-range-name
  }

    master_authorized_networks_config {
        cidr_blocks {
          cidr_block = var.authorized_ipv4_cidr_block
        } 
    }
  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }


}