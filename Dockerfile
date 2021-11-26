ARG BASE_IMAGE=taconsol/sakuli
ARG BASE_IMAGE_VERSION=2.5.1
FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

### Environment config
ENV IMG=taconsol/sakuli-remote-connection

USER 0

RUN apt-get update && \
    apt-get -y install remmina &&\
    apt-get clean && \
    wget -O - https://www.citrix.com/de-de/downloads/workspace-app/linux/workspace-app-for-linux-latest.html 2>/dev/null | grep '<a' | grep icaclient_ | grep _amd64 | sed 's/.*rel="/https:/g' | sed 's/".*//g' | sed 's/^/wget -O icaclient.deb /g' | sh  && \
    dpkg -i icaclient.deb && \
    chmod 777 /opt/Citrix/ICAClient && \
    rm icaclient.deb

### Copy env scripts for startup
COPY ./env/ $STARTUPDIR/env

USER 1000:1000
