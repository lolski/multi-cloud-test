resource "google_container_node_pool" "node_pool" {
  name = "${google_container_cluster.primary.name}-np"
  cluster = google_container_cluster.primary.name
#  version = var.cluster-version // TODO: set
  location = var.placement.region
  node_locations = var.placement.AZs
  node_count = var.instances.count.min
  autoscaling {
    min_node_count = var.instances.count.min
    max_node_count = var.instances.count.max
  }

  node_config {
    machine_type = var.instances.type
    service_account = "${var.service-account.name}@${var.project-id}.iam.gserviceaccount.com"
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      env = var.project-id
    }

    tags         = ["gke-node"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }

  lifecycle {
    ignore_changes = [
      initial_node_count,
      node_count,
      version,
    ]
  }

  management {
    auto_repair = true
    auto_upgrade = true // TODO: set to false
  }
}
