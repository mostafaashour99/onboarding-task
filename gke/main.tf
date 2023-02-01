resource "google_container_cluster" "primary" {
  name                     = var.cluster_name
  location                 = var.cluster_location
  # node_locations = [
    # "us-central1-c",
    # "us-central1-f"
  # ]
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = var.network_name
  subnetwork               = var.subnet_name
  logging_service          = "logging.googleapis.com/kubernetes"
  monitoring_service       = "monitoring.googleapis.com/kubernetes" 

  addons_config {
    http_load_balancing {
      disabled = true
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
    # autoscaling{
    #   disabled =true
    # }
  }

  workload_identity_config {
    workload_pool = "expanded-run-375112.svc.id.goog"
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "k8s-pod-range"
    services_secondary_range_name = "k8s-service-range"
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

release_channel {
	  channel = "STABLE"
  }
}