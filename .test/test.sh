#!/usr/bin/env bash

dgoss run \
    -e SAKULI_LICENSE_KEY=${SAKULI_LICENSE_KEY} \
    taconsol/sakuli-remote-connection:${1}