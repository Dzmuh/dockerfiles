# Firefox

Build:

``` bash
docker build --pull --rm -f "./Dockerfile" -t local/firefox:latest "$(pwd)"
```

Список пакетов которые будут установлены на базовый образ:

``` txt
  adwaita-icon-theme dbus dbus-user-session dconf-gsettings-backend
  dconf-service distro-info-data fontconfig glib-networking
  glib-networking-common glib-networking-services gsettings-desktop-schemas
  gtk-update-icon-cache hicolor-icon-theme humanity-icon-theme libapparmor1
  libargon2-1 libatk-bridge2.0-0 libatk1.0-0 libatk1.0-data libatspi2.0-0
  libavahi-client3 libavahi-common-data libavahi-common3 libbrotli1
  libcairo-gobject2 libcairo2 libcap2 libcolord2 libcryptsetup12 libcups2
  libdatrie1 libdbus-1-3 libdbus-glib-1-2 libdconf1 libdevmapper1.02.1
  libepoxy0 libfribidi0 libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-common
  libglib2.0-0 libgraphite2-3 libgssapi-krb5-2 libgtk-3-0 libgtk-3-common
  libharfbuzz0b libicu66 libip4tc2 libjbig0 libjpeg-turbo8 libjpeg8 libjson-c4
  libjson-glib-1.0-0 libjson-glib-1.0-common libk5crypto3 libkeyutils1
  libkmod2 libkrb5-3 libkrb5support0 liblcms2-2 libmpdec2 libpam-systemd
  libpango-1.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0 libpixman-1-0
  libproxy1v5 libpsl5 libpython3-stdlib libpython3.8-minimal
  libpython3.8-stdlib libreadline8 librest-0.7-0 librsvg2-2 librsvg2-common
  libsoup-gnome2.4-1 libsoup2.4-1 libsqlite3-0 libssl1.1 libthai-data libthai0
  libtiff5 libwayland-client0 libwayland-cursor0 libwayland-egl1 libwebp6
  libx11-xcb1 libxcb-render0 libxcb-shm0 libxcomposite1 libxcursor1
  libxdamage1 libxi6 libxinerama1 libxkbcommon0 libxml2 libxrandr2 libxt6
  lsb-release mime-support openssl python3 python3-minimal python3.8
  python3.8-minimal readline-common shared-mime-info systemd systemd-sysv
  systemd-timesyncd tzdata ubuntu-mono xkb-data
```

## Запуск

Тестовый запуск:

``` bash
docker run --rm -it --name firefox-x11 \
    --hostname=$(hostname) \
    --device /dev/snd \
    -e DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v "/home/$(whoami)/.Xauthority:/home/user/.Xauthority" \
    -v /etc/localtime:/etc/localtime:ro \
    local/firefox
```

### Запуск с сохранением всех настроек и файлов данных в стандартном расположении

Нужно создать стандартные расположения, чтобы их не создала служба Docker со всеми вытекающими последствиями в виде рутованых прав доступа.

``` bash
mkdir ~/.mozilla/docker-firefox-x11/
```

Запуск:

``` bash
docker run --rm -it --name firefox-x11 \
    --hostname=$(hostname) \
    --device /dev/snd \
    -e DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v "/home/$(whoami)/.Xauthority:/home/user/.Xauthority" \
    -v "/home/$(whoami)/.mozilla/docker-firefox-x11:/home/user/.mozilla/firefox/" \
    -v /etc/localtime:/etc/localtime:ro \
    local/firefox
```

## Links

Thanks!:
