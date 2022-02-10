ARG BASE_IMAGE=taconsol/sakuli
ARG BASE_IMAGE_VERSION=3.0.0
FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

### Environment config
ENV IMG=taconsol/sakuli-remote-connection

USER 0

RUN apt-get update && \
    apt-get -y install remmina &&\
    apt-get clean

### Copy env scripts for startup
COPY ./env/ $STARTUPDIR/env

USER 1000:1000
