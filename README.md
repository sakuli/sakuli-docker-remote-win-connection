# sakuli-docker-remote-win-connection
This repository contains a Docker image with pre-installed headless VNC environment, Sakuli and the rdp client remmina.

### Files and Directories

| Files/Directory                   |                                   |
|-----------------------------------|-----------------------------------|
| sakuli-remote-connection/         | Sakuli base Image with RDP client |
| sakuli-s2i-remote-connection/     | Sakuli S2I Image with RDP client  |

In order to build the s2i image, it is necessary to have access to the `taconsol/sakuli-remote-connection` image or
to build it first.

## Development

### Workstation setup
This project uses *dgoss* to verify the base container setup and service functionality. Please follow the 
[dgoss installation](https://github.com/aelsabbahy/goss/tree/master/extras/dgoss#installation) instructions before you
start working.


### Sakuli license
To use these scripts, it is required to set the [`SAKULI_LICENSE_KEY` environment variable](https://sakuli.io/docs/enterprise/)
containing a valid Sakuli license of size L or above. To obtain such a license, please visit the
[Sakuli license](https://confluence.consol.de/x/zwBoBw) page in confluence and choose one of the licenses for internal
use.