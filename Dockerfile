FROM taconsol/sakuli:latest

### Environment config
ENV IMG=taconsol/sakuli-remote-connection

USER 0

RUN apt-get update && \
    apt-get -y install remmina &&\
    apt-get clean

### Copy env scripts for startup
COPY ./env/ $STARTUPDIR/env

USER 1000:1000