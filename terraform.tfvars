namespace = "ganesh"

// Fleet
fleet-project-id = "vaticle-typedb-cloud-test"
fleet-region = "europe-west2"
fleet-gke-version = "1.25.5-gke.2000"

/*
 * typedb-cloud-deployment Kubernetes cluster
 */

// AWS
aws-region = "eu-west-2"
aws-subnet-az = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
aws-control-plane-instance-type = "t3.medium"
aws-node-pool-instance-type = "t3.medium"
aws-admin-users = ["ganesh@vaticle.com"]

// GCP
project = "vaticle-typedb-cloud-test" // var.gcp_project_id
region = "europe-west2" // var.gcp_location
zone = "europe-west2-a" // "${var.gcp_location}-a"
min_nodes = 0
max_nodes = 100
machine_type = "e2-standard-8"
auto_repair = true
auto_upgrade = true
credentials_file = "credentials/credentials.json"
ssh_private_key_file = "credentials/ssh-key.priv"
log_retention_days = 7
cluster_name = "ganesh" // var.name_prefix
gcp_service_account_name = "ganesh" // var.name_prefix