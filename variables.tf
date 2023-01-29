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


# -------------buckets--------
variable "gs-name" {
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