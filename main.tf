provider "google" {
  project = "expanded-run-375112"
}
module "networks" {
    source = "./network"
    network_name = var.vpc_name
    subnet_name = var.subnet_name
    subnet_cidr = var.subnet_cidr
    region = var.region

}
module "vm" {
    source = "./bastion"
    vm-name = var.vm-name
    vm-type = var.vm-type
    os-image = var.os-image
    vm-zone = var.vm-zone
    network_name = module.networks.network.name
    subnet_name = module.networks.private-subnet.name
}
module "gs" {
    source = "./buckets"
    gs-name = var.gs-name
    gs-storage-class = var.gs-storage-class
    gs-location = var.gs-location
}