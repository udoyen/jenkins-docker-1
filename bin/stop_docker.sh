#!/bin/bash

set -euo pipefail

CONFIG_FILE="`dirname \"$0\"`"/../config.sh
source ${CONFIG_FILE}

docker stop "${JENKINS_CONTAINER}"

