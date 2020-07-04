FROM dzmuh/ubuntu-base:latest
LABEL maintainer "Ilya Fralkou <ilya-fralkou@outlook.com>"

# Вывод звука и видео требует членства в группах audio и video для загрузки драйверов и доступа к DRM
ENV ENTRYPOINT_GROUPS="audio,video"

RUN apt-get update \
 && apt-get install --quiet --quiet --no-install-recommends \
    ca-certificates \
    firefox \
    quiterss \
 && apt-get clean --quiet \
 && apt-get autoremove --quiet \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /etc/skel

RUN mkdir --parent /volume/config \
  && chmod 777 /volume/config \
  && mkdir --parent /volume/data \
  && chmod 777 /volume/data

ENV VOL_CONFIG_DIR="/volume/config" \
    VOL_DATA_DIR="/volume/data"

RUN mkdir .config \
 && ln --symbolic "${VOL_CONFIG_DIR}" ".config/QuiteRss" \
 && mkdir .local \
 && mkdir .local/share \
 && ln --symbolic "${VOL_DATA_DIR}" ".local/share/QuiteRss"

VOLUME ["${VOL_CONFIG_DIR}", "${VOL_DATA_DIR}"]

ENV QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb

# Autorun QuiteRSS
ENTRYPOINT ["/entrypoint.sh", "quiterss"]
