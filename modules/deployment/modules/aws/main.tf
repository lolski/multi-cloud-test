/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


locals {
  name_prefix = var.resource-prefix
}

module "kms" {
  source        = "./modules/kms"
  anthos_prefix = local.name_prefix
  aws_region    = var.region
}

module "iam" {
  source                 = "./modules/iam"
  gcp_project_number     = module.gcp_data.project_number
  anthos_prefix          = local.name_prefix
  db_kms_arn             = module.kms.database_encryption_kms_key_arn
  cp_main_volume_kms_arn = module.kms.control_plane_main_volume_encryption_kms_key_arn
  cp_config_kms_arn      = module.kms.control_plane_config_encryption_kms_key_arn
  np_config_kms_arn      = module.kms.node_pool_config_encryption_kms_key_arn
}

module "vpc" {
  source                        = "./modules/vpc"
  aws_region                    = var.region
  vpc_cidr_block                = var.vpc_cidr_block
  anthos_prefix                 = local.name_prefix
  subnet_availability_zones     = var.subnet-az
  public_subnet_cidr_block      = var.public_subnet_cidr_block
  cp_private_subnet_cidr_blocks = var.cp_private_subnet_cidr_blocks
  np_private_subnet_cidr_blocks = var.np_private_subnet_cidr_blocks
}

module "gcp_data" {
  source       = "./modules/gcp_data"
  gcp_location = var.fleet-region
  gcp_project  = var.fleet-project-id
}

module "anthos_cluster" {
  source                                           = "./modules/anthos_cluster"
  anthos_prefix                                    = local.name_prefix
  location                                         = var.fleet-region
  aws_region                                       = var.region
  cluster_version                                  = coalesce(var.cluster-version, module.gcp_data.latest_version)
  database_encryption_kms_key_arn                  = module.kms.database_encryption_kms_key_arn
  control_plane_config_encryption_kms_key_arn      = module.kms.control_plane_config_encryption_kms_key_arn
  control_plane_root_volume_encryption_kms_key_arn = module.kms.control_plane_root_volume_encryption_kms_key_arn
  control_plane_main_volume_encryption_kms_key_arn = module.kms.control_plane_main_volume_encryption_kms_key_arn
  node_pool_config_encryption_kms_key_arn          = module.kms.node_pool_config_encryption_kms_key_arn
  node_pool_root_volume_encryption_kms_key_arn     = module.kms.node_pool_root_volume_encryption_kms_key_arn
  control_plane_iam_instance_profile               = module.iam.cp_instance_profile_id
  node_pool_iam_instance_profile                   = module.iam.np_instance_profile_id
  admin_users                                      = var.admins
  vpc_id                                           = module.vpc.aws_vpc_id
  role_arn                                         = module.iam.api_role_arn
  subnet_ids                                       = [module.vpc.aws_cp_subnet_id_1, module.vpc.aws_cp_subnet_id_2, module.vpc.aws_cp_subnet_id_3]
  node_pool_subnet_id                              = module.vpc.aws_cp_subnet_id_1
  fleet_project                                    = "projects/${module.gcp_data.project_number}"
  depends_on                                       = [module.kms, module.iam, module.vpc]
  control_plane_instance_type                      = var.control_plane_instance_type
  node_pool_instance_type                          = var.node_pool_instance_type

}

module "create_vars" {
  source                = "terraform-google-modules/gcloud/google"
  platform              = "linux"
  create_cmd_entrypoint = "${path.module}/modules/scripts/create_vars.sh"
  create_cmd_body       = "\"${module.anthos_cluster.cluster_name}\" \"${var.fleet-region}\" \"${var.region}\" \"${var.cluster-version}\" \"${module.kms.database_encryption_kms_key_arn}\" \"${module.iam.cp_instance_profile_id}\" \"${module.iam.api_role_arn}\" \"${module.vpc.aws_cp_subnet_id_1},${module.vpc.aws_cp_subnet_id_2},${module.vpc.aws_cp_subnet_id_3}\" \"${module.vpc.aws_vpc_id}\" \"${var.fleet-project-id}\" \"${var.pod_address_cidr_blocks}\" \"${var.service_address_cidr_blocks}\" \"${module.iam.np_instance_profile_id}\" \"${var.node_pool_instance_type}\" \"${module.kms.node_pool_config_encryption_kms_key_arn}\" \"${module.kms.node_pool_root_volume_encryption_kms_key_arn}\" ${path.module}/vars.sh"
  module_depends_on     = [module.anthos_cluster.cluster_name]
}
