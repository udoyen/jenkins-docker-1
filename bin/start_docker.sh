#!/bin/bash

set -euo pipefail

CONFIG_FILE="`dirname \"$0\"`"/../config.sh
source ${CONFIG_FILE}

container=$(docker run \
  --name=${JENKINS_CONTAINER} \
  -d \
  -p 8080:8080 \
  -p 50000:50000 \
  --label ${PROJECT_LABEL} \
  --mount type=volume,source=${JENKINS_VOLUME},target=/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkins:${JENKINS_VERSION})
echo $container
sleep 30
admin_pwd=$(docker exec jenkins /bin/bash -c "cat /var/jenkins_home/secrets/initialAdminPassword")
echo -e "Admin Password:\n\t${admin_pwd}\n"
