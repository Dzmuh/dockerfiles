FROM ubuntu:20.04
LABEL maintainer "Ilya Fralkou <ilya-fralkou@outlook.com>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y \
    ca-certificates \
    chromium-browser chromium-codecs-ffmpeg-extra \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Make a user
ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user \
	&& chown -R user:user $HOME \
	&& usermod -a -G audio,video user

WORKDIR $HOME
USER user

ENV QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb

# Autorun Chromium Browser
CMD ["chromium-browser"]