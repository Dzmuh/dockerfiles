FROM dzmuh/x11-common:latest
LABEL maintainer "Ilya Fralkou <ilya-fralkou@outlook.com>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y \
    ca-certificates \
    firefox  firefox-locale-en firefox-locale-ru breeze breeze-gtk-theme \
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
ENV DEBIAN_FRONTEND=interactive

# Autorun Firefox
CMD ["firefox"]