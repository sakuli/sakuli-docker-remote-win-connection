#!/usr/bin/env bash

npm --prefix ./license-validator ci
rm -rf ./env
mkdir -p ./env
cp -rf ./license-validator/dist/index.js ./env/startup.js
cp -rf ./license-validator/node_modules ./env/node_modules

docker build \
--no-cache \
-t taconsol/sakuli-remote-connection:2.3.0 \
-f Dockerfile . \
--build-arg=BASE_IMAGE=taconsol/sakuli \
--build-arg=BASE_IMAGE_VERSION=2.3.0

cd ./.test/
sh test.sh 2.3.0
cd -
