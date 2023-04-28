project-id = "vaticle-typedb-cloud-test" // project id or resource group
resource-prefix = "ganesh2"
cluster-version = "1.25.5-gke.2000"

aws = {
  region = "eu-west-2"
}

gcp = {
  service-account = {
    file = "credentials/vaticle-typedb-cloud-test-73347dd8b880.json"
    name = "ganesh"
  }
  ssh-private-key-file = "credentials/ssh-key.priv"
}

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

  providers = {
    auth0 = {
      domain = "ganesh2-cloud-typedb.eu.auth0.com"
      client-id = "r1WYQjLi5vUT2cHJxkJhI8tmStxeinI8"
      client-secret = "BvpzuWDMcReorEgBmrztxP28uW41rapvqm3Pi0kuy9_FWvdU3CesQiRaEQbbNDw1"
    }

    cloudflare = {
      api-token = "3JvsGQa5tNPHxPmf1a_0t5Rg1RvaukWM93Mn1zBI"
      zone-id = "b38707ef9ec8eb3d02f7fcf5d11493d2"
    }
  }

  log-retention-days = 7

  platform-deployment-repo = "lolski/typedb-cloud-deployment-test"

  typedb-cloud-server-app = "typedb-cloud-server"
}

deployment = {
  aws = {
    admins = ["ganesh@vaticle.com"]
  }
}
