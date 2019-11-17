#!/bin/bash

set -euo pipefail

BIN_DIRECTORY="`dirname \"$0\"`"

CONFIG_FILE="${BIN_DIRECTORY}"/../config.sh
source ${CONFIG_FILE}

source ${BIN_DIRECTORY}/make_container.sh

sleep 30
admin_pwd=$(docker exec jenkins /bin/bash -c "cat /var/jenkins_home/secrets/initialAdminPassword")
echo -e "Admin Password:\n\t${admin_pwd}\n"
