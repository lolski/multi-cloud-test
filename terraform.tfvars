name_prefix = "ganesh"
cluster_version = "1.25.5-gke.2000"
gcp_project_id = "vaticle-typedb-cloud-test"
gcp_location = "europe-west2"

/*
 * typedb-cloud-deployment Kubernetes cluster
 */

// AWS
admin_users = ["ganesh@vaticle.com"]
aws_region                = "eu-west-2"
subnet_availability_zones = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
node_pool_instance_type     = "t3.medium"
control_plane_instance_type = "t3.medium"

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