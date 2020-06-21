# QuiteRSS

Build:

``` bash
docker build --pull --rm -f "./Dockerfile" -t local/quiterss:latest "$(pwd)"
```

Список пакетов которые будут установлены на базовый образ:

``` txt
fontconfig fontconfig-config fonts-dejavu-core iso-codes libasyncns0
  libavahi-client3 libavahi-common-data libavahi-common3 libbrotli1 libbsd0
  libcap2 libcap2-bin libcups2 libdbus-1-3 libdouble-conversion3
  libdrm-amdgpu1 libdrm-common libdrm-intel1 libdrm-nouveau2 libdrm-radeon1
  libdrm2 libedit2 libegl-mesa0 libegl1 libelf1 libevdev2 libexpat1 libflac8
  libfontconfig1 libfreetype6 libgbm1 libgl1 libgl1-mesa-dri libglapi-mesa
  libglib2.0-0 libglvnd0 libglx-mesa0 libglx0 libgraphite2-3 libgssapi-krb5-2
  libgstreamer-plugins-base1.0-0 libgstreamer1.0-0 libgudev-1.0-0
  libharfbuzz0b libhyphen0 libice6 libicu66 libinput-bin libinput10
  libjpeg-turbo8 libjpeg8 libk5crypto3 libkeyutils1 libkrb5-3 libkrb5support0
  libllvm9 libmtdev1 libogg0 liborc-0.4-0 libpciaccess0 libpcre2-16-0
  libpng16-16 libpulse0 libqt5core5a libqt5dbus5 libqt5gui5 libqt5multimedia5
  libqt5network5 libqt5positioning5 libqt5printsupport5 libqt5qml5
  libqt5quick5 libqt5sensors5 libqt5sql5 libqt5sql5-sqlite libqt5webchannel5
  libqt5webkit5 libqt5widgets5 libqt5xml5 libsensors-config libsensors5 libsm6
  libsndfile1 libsqlite3-0 libssl1.1 libvorbis0a libvorbisenc2 libvulkan1
  libwacom-common libwacom2 libwayland-client0 libwayland-server0 libwebp6
  libwoff1 libwrap0 libx11-6 libx11-data libx11-xcb1 libxau6 libxcb-dri2-0
  libxcb-dri3-0 libxcb-glx0 libxcb-icccm4 libxcb-image0 libxcb-keysyms1
  libxcb-present0 libxcb-randr0 libxcb-render-util0 libxcb-render0
  libxcb-shape0 libxcb-shm0 libxcb-sync1 libxcb-util1 libxcb-xfixes0
  libxcb-xinerama0 libxcb-xinput0 libxcb-xkb1 libxcb1 libxdamage1 libxdmcp6
  libxext6 libxfixes3 libxkbcommon-x11-0 libxkbcommon0 libxml2 libxrender1
  libxshmfence1 libxslt1.1 libxxf86vm1 openssl tzdata ucf x11-common xkb-data
```

## Запуск

Тестовый запуск:

``` bash
docker run --rm -it --name quiterss \
    --hostname=$(hostname) \
    --device /dev/snd \
    -e DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v "/home/$(whoami)/.Xauthority:/home/user/.Xauthority" \
    -v /etc/localtime:/etc/localtime:ro \
    local/quiterss
```

### Запуск с сохранением всех настроек и файлов данных в стандартном расположении

Нужно создать стандартные расположения, чтобы их не создала служба Docker со всеми вытекающими последствиями в виде рутованых прав доступа.

``` bash
mkdir ~/.config/QuiteRss/
mkdir ~/.local/share/QuiteRss/
```

Запуск:

``` bash
docker run --rm -it --name quiterss \
    --hostname=$(hostname) \
    --device /dev/snd \
    -e DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v "/home/$(whoami)/.Xauthority:/home/user/.Xauthority" \
    -v "/home/$(whoami)/.config/QuiteRss:/home/user/.config/QuiteRss/" \
    -v "/home/$(whoami)/.local/share/QuiteRss/:/home/user/.local/share/QuiteRss/" \
    -v /etc/localtime:/etc/localtime:ro \
    local/quiterss
```

## Links

Thanks!:

* [stevenk11/quiterss - Docker Hub](https://hub.docker.com/r/stevenk11/quiterss)
  * [sources](https://github.com/stevenk11/quiterss)