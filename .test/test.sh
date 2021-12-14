#!/usr/bin/env bash

IMAGE_TAG=${1:-latest}

dgoss run \
    taconsol/sakuli-remote-connection:${IMAGE_TAG}
