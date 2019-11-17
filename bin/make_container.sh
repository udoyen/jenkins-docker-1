#!/bin/bash

set -euo pipefail

CONFIG_FILE="`dirname \"$0\"`"/../config.sh
source ${CONFIG_FILE}

container=$(docker run \
  --name=${JENKINS_CONTAINER} \
  -d \
  -p ${HOST_PORT}:8080 \
  -p 50000:50000 \
  --label ${PROJECT_LABEL} \
  --mount type=volume,source=${JENKINS_VOLUME},target=/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkins:${JENKINS_VERSION})
echo $container
