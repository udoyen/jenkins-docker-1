#!/bin/bash

set -euo pipefail

CONFIG_FILE="`dirname \"$0\"`"/../config.sh
source ${CONFIG_FILE}


echo "Starting to build image"

docker image build \
    --rm \
    --build-arg uid=$(id -u) \
    --build-arg gid=$(id -g) \
    --build-arg JENKINS_URL=${JENKINS_URL} \
    --build-arg JENKINS_SHA=${JENKINS_SHA} \
    -t ${JENKINS_IMAGE_INTERMEDIATE} \
    -f Dockerfile-slim \
    https://github.com/jenkinsci/docker.git

echo "Image built: ${JENKINS_IMAGE_INTERMEDIATE}"