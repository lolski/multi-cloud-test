#!/bin/bash

# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# [START anthos_scripts_create_vars]

# create vars.sh file
set -ex

  cat <<EOF > "${17}"
export FLEET_PROJECT_ID=$(gcloud info --format="value(config.project)")
export FLEET_LOCATION=${2}
export FLEET_CLUSTER_VERSION=${4}

export AWS_VPC_ID=${9}
export AWS_REGION=${3}
export AWS_SUBNET_IDS=${8}

export AWS_CLUSTER_NAME=${1}

export AWS_CONFIG_ENCRYPTION_KMS_KEY_ARN=${5}
export AWS_DATABASE_ENCRYPTION_KMS_KEY_ARN=${5}

export AWS_CP_IAM_ROLE_ARN=${7}
export AWS_CP_IAM_INSTANCE_PROFILE=${6}

#export AWS_NODE_POOL_SUBNET=
export AWS_NODE_POOL_INSTANCE_TYPE=${14}
export AWS_NODE_POOL_IAM_INSTANCE_PROFILE=${13}

export AWS_NODE_POOL_CONFIG_ENCRYPTION_KEY=${15}
export AWS_NODE_POOL_ROOT_ENCRYPTION_KEY=${16}

export AWS_SERVICE_ADDRESS_CIDR_BLOCKS=${12}
#AWS_SERVICE_ADDRESS_CIDR_BLOCKS="10.1.0.0/16"
#AWS_POD_ADDRESS_CIDR_BLOCKS="10.2.0.0/16"

#AWS_SSH_KEY_PAIR_NAME=

EOF

# [END anthos_scripts_create_vars]
