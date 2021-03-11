#!/usr/bin/env bash

set -ex

BASE_IMAGE=${1:-taconsol/sakuli}
BASE_IMAGE_VERSION=${2:-2.5.0}

echo "Base image: ${BASE_IMAGE}"
echo "Base image version: ${BASE_IMAGE_VERSION}"

npm --prefix ./license-validator ci
rm -rf ./env
mkdir -p ./env
cp -rf ./license-validator/dist/index.js ./env/startup.js
cp -rf ./license-validator/node_modules ./env/node_modules

docker build \
--no-cache \
-t taconsol/sakuli-remote-connection:${BASE_IMAGE_VERSION} \
-f Dockerfile . \
--build-arg=BASE_IMAGE=${BASE_IMAGE} \
--build-arg=BASE_IMAGE_VERSION=${BASE_IMAGE_VERSION}

cd ./.test/
sh test.sh ${BASE_IMAGE_VERSION}
cd -
