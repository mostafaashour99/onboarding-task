project = "alitest-375008"

# network
vpc_name = "vpc-main"
subnet_name = "private-subnet"
subnet_cidr = "10.0.0.0/24"
region = "us-central1"
pod-range-secondary_ip_range-name = "k8s-pod-range"
pod-range-secondary_ip_range = "10.1.0.0/16"
service-range-secondary_ip_range-name = "k8s-service-range"
service-range-secondary_ip_range = "10.2.0.0/20"
# vm
vm-name = "app-cluster"
vm-type = "e2-medium"
os-image = "debian-cloud/debian-11"
vm-zone = "us-central1-a"
bastion-sa_id ="bastion-sa"

# bucket
buckets-sa-id = "buckets"
gs-name = ["example-task-multiple-buckets-b1","example-task-multiple-buckets-b2","example-task-multiple-buckets-b3"]
gs-storage-class = "STANDARD"
gs-location = "US"

# cluster
cluster_name = "task"
cluster_location = "us-central1-c"
node_type = "e2-standard-2"
node_locations = ["us-central1-c","us-central1-f"]

# -------- bigquery
dataset_name_id = { "example_dataset_id_1" = "data_set1" ,"example_dataset_id_2" = "data_set2","example_dataset_id_3" = "data_set3"  }