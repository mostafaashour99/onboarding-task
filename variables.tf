variable "project" {
  type = string
}

variable "vpc_name" {
    type = string
  
}
variable "subnet_name" {
    type = string
    
}
variable "subnet_cidr" {
    type = string
    
}
variable "region" {
    type = string
    
}
variable "pod-range-secondary_ip_range-name" {
    type = string
}
variable "pod-range-secondary_ip_range" {
    type = string
}
variable "service-range-secondary_ip_range-name" {
    type = string
}
variable "service-range-secondary_ip_range" {
    type = string
}

# --------vm--------------
variable "vm-name" {
    type = string
}
variable "vm-type" {
    type = string
}
variable "os-image" {
    type = string
}
variable "vm-zone" {
    type = string
}
variable "bastion-sa_id" {
  type = string
}


# -------------buckets--------
variable "gs-name" {
  type = list
}
variable "buckets-sa-id" {
  type = string
}

variable "gs-location" {
  type = string
}
variable "gs-storage-class" {
  type = string
}
# ------------cluster

variable "cluster_name" {
  type = string
  description = "cluster_name"
}

variable "cluster_location" {
  type = string
  description = "cluster location"
}

variable "authorized_ipv4_cidr_block" {
  type = string
  description = "The CIDR block where HTTPS access is allowed from"
  default = null
}
variable "node_type" {
  type = string
}
variable "node_locations" {
  type = list
}
# -------------bigquery-----------

variable "dataset_name_id" {
  type = map
}