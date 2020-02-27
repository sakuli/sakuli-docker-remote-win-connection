#!/usr/bin/env bash

git clone git@github.com:sakuli/sakuli-openshift-s2i.git
cd ./sakuli-openshift-s2i

#todo: remove checkout after the configurable-s2i-base-image is merged
git checkout feature/configurable-s2i-base-image

docker build \
--no-cache \
--build-arg=BASE_IMAGE_VERSION=latest \
--build-arg=BASE_IMAGE=sakuli-remote-connection \
-t taconsol/sakuli-s2i-remote-connection .

cd ..
test/run
rm -rf ./sakuli-openshift-s2i
