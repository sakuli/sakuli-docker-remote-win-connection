#!/usr/bin/env bash

npm --prefix ./license-validator ci
rm -rf ./env
mkdir -p ./env
cp -rf ./license-validator/dist/index.js ./env/startup.js
cp -rf ./license-validator/node_modules ./env/node_modules

docker build \
--no-cache \
-t taconsol/sakuli-remote-connection \
.

cd ./.test/
sh test.sh latest
cd -
rm -rf ./src