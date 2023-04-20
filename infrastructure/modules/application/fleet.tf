resource "google_gke_hub_membership" "primary-fleet-membership" {
  project = var.project-id
  membership_id = google_container_cluster.primary.name
  endpoint {
    gke_cluster {
      resource_link = "//container.googleapis.com/${google_container_cluster.primary.id}"
    }
  }
}