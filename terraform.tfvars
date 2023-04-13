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
