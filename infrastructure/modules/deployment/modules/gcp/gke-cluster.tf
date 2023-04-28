resource "google_container_cluster" "primary" {
  name     = "${var.resource-prefix}-gke-gcp"
  location = var.placement.region
  node_locations = var.placement.AZs

  # Deletes initial node pool
  # Replaces with separately managed node pool
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name
}
