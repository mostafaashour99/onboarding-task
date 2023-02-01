project = "expanded-run-375112"

# network
vpc_name = "kubernetes-cluster"
subnet_name = "restricted-subnet"
subnet_cidr = "10.0.0.0/16"
region = "us-central1"
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
dataset_name = "data_set1"