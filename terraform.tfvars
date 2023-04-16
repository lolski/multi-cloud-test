resource-prefix = "ganesh"

// Fleet
project-id = "vaticle-typedb-cloud-test"
fleet-region = "europe-west2"
cluster-version = "1.25.5-gke.2000"

/*
 * typedb-cloud-deployment Kubernetes cluster
 */

// AWS
deployment-cluster-aws-region = "eu-west-2"
deployment-cluster-aws-subnet-az = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
deployment-cluster-aws-control-plane-inst-type = "t3.medium"
deployment-cluster-aws-node-pool-inst-type = "t3.medium"
deployment-cluster-aws-admins = ["ganesh@vaticle.com"]

// GCP
deployment-cluster-gcp-project-id = "vaticle-typedb-cloud-test" // var.gcp_project_id
deployment-cluster-gcp-region = "europe-west2" // var.gcp_location
deployment-cluster-gcp-az = "europe-west2-a" // "${var.gcp_location}-a"
deployment-cluster-gcp-instance-type = "e2-standard-8"
deployment-cluster-gcp-min-nodes = 0
deployment-cluster-gcp-max-nodes = 100
deployment-cluster-gcp-auto-repair = true
deployment-cluster-gcp-auto-upgrade = true
deployment-cluster-gcp-credentials = "credentials/credentials.json"
deployment-cluster-gcp-ssh-private-key = "credentials/ssh-key.priv"
deployment-cluster-gcp-svc-acc-name = "ganesh" // var.name_prefix