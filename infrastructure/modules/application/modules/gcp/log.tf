#resource "google_logging_project_bucket_config" "bucket" {
#  project    = var.project
#  location  = var.region
#  retention_days = var.log_retention_days
#  bucket_id = var.resource_prefix
#}

#resource "google_logging_project_sink" "sink" {
#  name = var.resource_prefix
#  destination = "logging.googleapis.com/projects/${var.project}/locations/${var.region}/buckets/${google_logging_project_bucket_config.bucket.bucket_id}"
#  filter = "resource.labels.container_name = \"${var.typedb_cloud_server_app}\" AND resource.labels.cluster_name = \"${var.resource_prefix}\""
#
#  #  This flag is required to be set if the sink and bucket are local to a project.
#  # However, Terraform will not attempt to create a writer identity, since the sink and bucket are in the same project.
#  unique_writer_identity = true
#}
