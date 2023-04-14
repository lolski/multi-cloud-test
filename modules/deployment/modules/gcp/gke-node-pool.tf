resource "google_container_node_pool" "node_pool" {
  name       = "${google_container_cluster.primary.name}-node-pool"
  location   = var.region
  node_locations = [var.az]
  cluster    = google_container_cluster.primary.name
  node_count = var.min-nodes
  autoscaling {
    min_node_count = var.min-nodes
    max_node_count = var.max-nodes
  }

  node_config {
    machine_type = var.instance-type
    service_account = "${var.sa-name}@${var.project-id}.iam.gserviceaccount.com"
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
    auto_upgrade = true
  }
}
