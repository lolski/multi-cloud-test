resource-prefix = "ganesh"

// Fleet
project-id = "vaticle-typedb-cloud-test"
fleet-region = "europe-west2"
cluster-version = "1.25.5-gke.2000"

// Application cluster
application-cluster-project-id = "vaticle-typedb-cloud-test" // var.gcp_project_id
application-cluster-region = "europe-west2" // var.gcp_location
application-cluster-az = "europe-west2-a" // "${var.gcp_location}-a"
application-cluster-instance-type = "e2-standard-8"
application-cluster-min-nodes = 0
application-cluster-max-nodes = 100
application-cluster-credentials = "credentials/credentials.json"
application-cluster-ssh-private-key = "credentials/ssh-key.priv"
application-cluster-svc-acc-name = "ganesh" // var.name_prefix

// Deployment cluster: AWS
deployment-cluster-aws-region = "eu-west-2"
deployment-cluster-aws-subnet-az = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
deployment-cluster-aws-control-plane-inst-type = "t3.medium"
deployment-cluster-aws-node-pool-inst-type = "t3.medium"
deployment-cluster-aws-admins = ["ganesh@vaticle.com"]

deployment = {
  gcp = {
    project-id = "vaticle-typedb-cloud-test" // var.gcp_project_id

    service-account = {
      file = "credentials/credentials.json"
      name = "ganesh" // var.name_prefix
    }
    ssh-private-key-file = "credentials/ssh-key.priv"
  }
}
