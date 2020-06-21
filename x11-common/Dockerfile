FROM ubuntu:20.04
LABEL maintainer "Ilya Fralkou <ilya-fralkou@outlook.com>"

RUN apt-get update \
    && apt-get install -y \
        apt-utils \
        x11-common libx11-6 libx11-data libxau6 libxcb1 libbsd0 libxrender1 \
        fontconfig-config libfontconfig1 fonts-dejavu-core libfreetype6 \
        libexpat1 libice6 libpng16-16 libsm6 libxdmcp6 libxext6 libxfixes3 ucf \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*