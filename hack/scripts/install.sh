#!/usr/bin/env bash

set -e

LIBS_DIR="$(dirname "$0")/libs"
PKG_MANAGER=""
PACKAGES="jq"

echo "$(date) - checking yum or apt" >> /tmp/flex-docker-init.log
HAS_YUM=$(which yum &> /dev/null; echo $?)
HAS_APT=$(which apt &> /dev/null; echo $?)

if [ "${HAS_YUM}" == "0" ]; then
    PKG_MANAGER="yum"
    yum install -y epel-release
elif [ "${HAS_APT}" == "0" ]; then
    PKG_MANAGER="apt-get"
    apt-get update
else
    echo "Installation supports 'yum' or 'apt-get'"
    exit 1
fi

echo "$(date) - PKG_MANAGER is ${PKG_MANAGER}" >> /tmp/flex-docker-init.log

echo "Installing required packages"
echo "$(date) - Installing required packages - ${PACKAGES}" >> /tmp/flex-docker-init.log

${PKG_MANAGER} install -y ${PACKAGES} &>> /tmp/flex-docker-init.log

echo "$(date) - Installation Completed" >> /tmp/flex-docker-init.log
