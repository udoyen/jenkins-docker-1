#!/bin/bash

set -euo pipefail

CONFIG_FILE="`dirname \"$0\"`"/../config.sh
source ${CONFIG_FILE}

docker start "${JENKINS_CONTAINER}"

