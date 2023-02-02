provider "google" {
  project = "alitest-375008"
}
module "networks" {
    source = "./network"
    network_name = var.vpc_name
    subnet_name = var.subnet_name
    subnet_cidr = var.subnet_cidr
    region = var.region
    pod-range-secondary_ip_range-name = var.pod-range-secondary_ip_range-name
    pod-range-secondary_ip_range = var.pod-range-secondary_ip_range
    service-range-secondary_ip_range-name = var.service-range-secondary_ip_range-name
    service-range-secondary_ip_range = var.service-range-secondary_ip_range

}
module "vm" {
    source = "./bastion"
    vm-name = var.vm-name
    vm-type = var.vm-type
    os-image = var.os-image
    vm-zone = var.vm-zone
    network_name = module.networks.network.name
    subnet_name = module.networks.private-subnet.name
    bastion-sa_id = var.bastion-sa_id 
}
module "gs" {
    source = "./buckets"
    project_id = var.project
    buckets-sa-id = var.buckets-sa-id
    gs-name = var.gs-name
    gs-storage-class = var.gs-storage-class
    gs-location = var.gs-location
}

module "gke" {
  source = "./gke"
  project_id = var.project
  cluster_name = var.cluster_name
  cluster_location = var.cluster_location
  network_name = var.vpc_name
  subnet_name = var.subnet_name
  authorized_ipv4_cidr_block = var.subnet_cidr
  node_type = var.node_type
  node_locations = var.node_locations
  pod-range-name = module.networks.pod-range-name
  service-range-name = module.networks.service-range-name
}

module "bigquery" {
  source = "./BigQuery"
  project_id = var.project
  dataset_name = var.dataset_name_id
  region = "US"
}