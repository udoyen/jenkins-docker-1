#!/bin/bash

set -euo pipefail

CONFIG_FILE="`dirname \"$0\"`"/../config.sh
source ${CONFIG_FILE}


docker image build \
    --rm \
    --build-arg DOCKER_HOST_GID=${DOCKER_HOST_GID} \
    --build-arg DOCKER_CE_VERSION_STRING="${DOCKER_CE_VERSION_STRING}" \
    --build-arg JENKINS_IMAGE=${JENKINS_IMAGE_INTERMEDIATE} \
    -t ${JENKINS_IMAGE} \
    -f ./docker/Dockerfile \
    .

docker image rm ${JENKINS_IMAGE_INTERMEDIATE}
