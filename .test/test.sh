#!/usr/bin/env bash

IMAGE_TAG=${1:-latest}

dgoss run \
    -e SAKULI_LICENSE_KEY=${SAKULI_LICENSE_KEY} \
    taconsol/sakuli-remote-connection:${IMAGE_TAG}
