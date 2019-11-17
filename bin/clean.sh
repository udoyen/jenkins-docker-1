#!/bin/bash

CONFIG_FILE="`dirname \"$0\"`"/../config.sh
source ${CONFIG_FILE}

docker container stop jenkins
docker container rm -f ${JENKINS_CONTAINER}
docker image remove -f ${JENKINS_IMAGE}
docker volume remove -f ${JENKINS_VOLUME}
