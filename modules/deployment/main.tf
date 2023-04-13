module "aws" {
    source = "./modules/aws"
    name_prefix = var.name_prefix
    cluster_version = var.cluster_version
    gcp_project_id = var.gcp_project_id
    gcp_location = var.gcp_location
    admin_users = var.admin_users
    aws_region = var.aws_region
    subnet_availability_zones = var.subnet_availability_zones
    node_pool_instance_type = var.node_pool_instance_type
    control_plane_instance_type = var.control_plane_instance_type
}
