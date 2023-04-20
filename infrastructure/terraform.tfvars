project-id = "vaticle-typedb-cloud-test" // project id or resource group
aws-region = "eu-west-2"
gcp = {
  service-account = {
    file = "credentials/credentials.json"
    name = "ganesh"
  }
  ssh-private-key-file = "credentials/ssh-key.priv"
}

resource-prefix = "ganesh"
cluster-version = "1.25.5-gke.2000"

application = {
  placement = {
    region = "europe-west2"
    AZs = ["europe-west2-a"]
  }
  instances = {
    count = {
      min = 0
      max = 5
    }
    type = "e2-standard-8"
  }
}

deployment = {
  aws = {
    admins = ["ganesh@vaticle.com"]
  }
}
