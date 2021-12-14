#!/usr/bin/env bash

set -ex

BASE_IMAGE=${1:-taconsol/sakuli}
BASE_IMAGE_VERSION=${2:-latest}

echo "Base image: ${BASE_IMAGE}"
echo "Base image version: ${BASE_IMAGE_VERSION}"

echo "Removing possible leftovers"
rm -rf ./env
mkdir -p ./env

docker build \
--no-cache \
-t taconsol/sakuli-remote-connection:${BASE_IMAGE_VERSION} \
-f Dockerfile . \
--build-arg=BASE_IMAGE=${BASE_IMAGE} \
--build-arg=BASE_IMAGE_VERSION=${BASE_IMAGE_VERSION}

cd ./.test/
chmod u+x test.sh
sh test.sh
cd -
