FROM dzmuh/ubuntu-base-x11
LABEL maintainer "Ilya Fralkou <ilya-fralkou@outlook.com>"

ARG INSTALL_CANDIDATE=google-chrome
ARG INSTALL_CANDIDATE_VERSION=stable

ENV USER_DATA_DIR="/var/lib/chrome/data" \
    USER_DOWNLOAD_DIR="/var/lib/chrome/downloads"

# Устанавливаю Google Chrome (использую Минское время) со стороннего ppa, что-бы иметь послежнюю версию.
# (источники: http://www.ubuntuupdates.org/ppa/google_chrome, https://www.google.com/linuxrepositories/)
RUN ln --symbolic --force /usr/share/zoneinfo/Europe/Minsk /etc/localtime \
 && dpkg-reconfigure tzdata \
 && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
 && curl \
    --fail \
    --insecure \
    --location \
    --remote-name \
    --show-error \
    https://dl.google.com/linux/linux_signing_key.pub \
 && apt-key add linux_signing_key.pub \
 && apt-get --quiet --quiet update \
 && apt-get --quiet --quiet --assume-yes --no-install-recommends install \
    "${INSTALL_CANDIDATE}-${INSTALL_CANDIDATE_VERSION}" \
 && apt-get clean

WORKDIR /etc/skel
RUN ln --symbolic "${USER_DOWNLOAD_DIR}" Downloads \
 && mkdir .config \
 && ln --symbolic "${USER_DATA_DIR}" ".config/${INSTALL_CANDIDATE}"

VOLUME ["${USER_DOWNLOAD_DIR}", "${USER_DATA_DIR}"]

ENV QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb
WORKDIR "${USER_DOWNLOAD_DIR}"
ENTRYPOINT ["/entrypoint.sh", "google-chrome"]
##CMD [ "--start-maximized", "--disable-dev-shm-usage", "--no-default-browser-check", "--no-first-run", "--incognito" ]
CMD [ "--start-maximized", "--disable-dev-shm-usage", "--no-default-browser-check", "--no-first-run" ]