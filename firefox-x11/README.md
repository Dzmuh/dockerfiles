# Firefox

Build:

``` bash
docker build --pull --rm -f "./Dockerfile" -t local/firefox:latest "$(pwd)"
```

Список пакетов которые будут установлены на базовый образ:

``` txt
adwaita-icon-theme breeze breeze-cursor-theme breeze-gtk-theme
  breeze-icon-theme ca-certificates dbus dbus-user-session
  dconf-gsettings-backend dconf-service dirmngr distro-info-data firefox
  firefox-locale-en firefox-locale-ru fontconfig glib-networking
  glib-networking-common glib-networking-services gnupg gnupg-l10n gnupg-utils
  gpg gpg-agent gpg-wks-client gpg-wks-server gpgconf gpgsm
  gsettings-desktop-schemas gtk-update-icon-cache gtk2-engines-pixbuf
  hicolor-icon-theme humanity-icon-theme kde-style-breeze kio kpackagetool5
  kwayland-data kwin-style-breeze libapparmor1 libargon2-1 libasn1-8-heimdal
  libasound2 libasound2-data libassuan0 libatk-bridge2.0-0 libatk1.0-0
  libatk1.0-data libatspi2.0-0 libavahi-client3 libavahi-common-data
  libavahi-common3 libbrotli1 libcairo-gobject2 libcairo2 libcanberra0 libcap2
  libcolord2 libcryptsetup12 libcups2 libdatrie1 libdbus-1-3 libdbus-glib-1-2
  libdbusmenu-qt5-2 libdconf1 libdevmapper1.02.1 libdouble-conversion3
  libdrm-amdgpu1 libdrm-common libdrm-intel1 libdrm-nouveau2 libdrm-radeon1
  libdrm2 libedit2 libegl-mesa0 libegl1 libelf1 libepoxy0 libevdev2 libfam0
  libfribidi0 libgbm1 libgdbm-compat4 libgdbm6 libgdk-pixbuf2.0-0
  libgdk-pixbuf2.0-common libgl1 libgl1-mesa-dri libglapi-mesa libglib2.0-0
  libglvnd0 libglx-mesa0 libglx0 libgpgme11 libgpgmepp6 libgraphite2-3
  libgssapi-krb5-2 libgssapi3-heimdal libgtk-3-0 libgtk-3-common
  libgudev-1.0-0 libharfbuzz0b libhcrypto4-heimdal libheimbase1-heimdal
  libheimntlm0-heimdal libhx509-5-heimdal libicu66 libinput-bin libinput10
  libip4tc2 libjbig0 libjpeg-turbo8 libjpeg8 libjson-c4 libjson-glib-1.0-0
  libjson-glib-1.0-common libk5crypto3 libkdecorations2-5v5
  libkdecorations2private7 libkeyutils1 libkf5archive5 libkf5attica5
  libkf5auth-data libkf5auth5 libkf5authcore5 libkf5codecs-data libkf5codecs5
  libkf5completion-data libkf5completion5 libkf5config-data libkf5configcore5
  libkf5configgui5 libkf5configwidgets-data libkf5configwidgets5
  libkf5coreaddons-data libkf5coreaddons5 libkf5crash5 libkf5dbusaddons-data
  libkf5dbusaddons5 libkf5declarative-data libkf5declarative5 libkf5doctools5
  libkf5globalaccel-data libkf5globalaccel5 libkf5guiaddons5 libkf5i18n-data
  libkf5i18n5 libkf5iconthemes-data libkf5iconthemes5 libkf5itemviews-data
  libkf5itemviews5 libkf5jobwidgets-data libkf5jobwidgets5 libkf5kcmutils-data
  libkf5kcmutils5 libkf5kiocore5 libkf5kiontlm5 libkf5kiowidgets5
  libkf5notifications-data libkf5notifications5 libkf5package-data
  libkf5package5 libkf5quickaddons5 libkf5service-bin libkf5service-data
  libkf5service5 libkf5solid5 libkf5solid5-data libkf5sonnet5-data
  libkf5sonnetcore5 libkf5sonnetui5 libkf5style5 libkf5textwidgets-data
  libkf5textwidgets5 libkf5wallet-bin libkf5wallet-data libkf5wallet5
  libkf5waylandclient5 libkf5widgetsaddons-data libkf5widgetsaddons5
  libkf5windowsystem-data libkf5windowsystem5 libkf5xmlgui-bin
  libkf5xmlgui-data libkf5xmlgui5 libkmod2 libkrb5-26-heimdal libkrb5-3
  libkrb5support0 libksba8 libkwalletbackend5-5 liblcms2-2 libldap-2.4-2
  libldap-common libllvm9 libltdl7 libmpdec2 libmtdev1 libnpth0 libogg0
  libpam-systemd libpango-1.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0
  libpciaccess0 libpcre2-16-0 libperl5.30 libpixman-1-0 libpolkit-agent-1-0
  libpolkit-gobject-1-0 libpolkit-qt5-1-1 libproxy1v5 libpsl5
  libpython3-stdlib libpython3.8-minimal libpython3.8-stdlib libqt5core5a
  libqt5dbus5 libqt5gui5 libqt5network5 libqt5printsupport5 libqt5qml5
  libqt5quick5 libqt5quickwidgets5 libqt5svg5 libqt5texttospeech5
  libqt5widgets5 libqt5x11extras5 libqt5xml5 libreadline8 librest-0.7-0
  libroken18-heimdal librsvg2-2 librsvg2-common libsasl2-2 libsasl2-modules-db
  libsensors-config libsensors5 libsoup-gnome2.4-1 libsoup2.4-1 libsqlite3-0
  libssl1.1 libtdb1 libthai-data libthai0 libtiff5 libvorbis0a libvorbisfile3
  libvulkan1 libwacom-common libwacom2 libwayland-client0 libwayland-cursor0
  libwayland-egl1 libwayland-server0 libwebp6 libwind0-heimdal libx11-xcb1
  libxcb-dri2-0 libxcb-dri3-0 libxcb-glx0 libxcb-icccm4 libxcb-image0
  libxcb-keysyms1 libxcb-present0 libxcb-randr0 libxcb-render-util0
  libxcb-render0 libxcb-res0 libxcb-shape0 libxcb-shm0 libxcb-sync1
  libxcb-util1 libxcb-xfixes0 libxcb-xinerama0 libxcb-xinput0 libxcb-xkb1
  libxcomposite1 libxcursor1 libxdamage1 libxi6 libxinerama1
  libxkbcommon-x11-0 libxkbcommon0 libxml2 libxrandr2 libxshmfence1 libxslt1.1
  libxt6 libxxf86vm1 lsb-release mime-support openssl perl perl-modules-5.30
  pinentry-curses python3 python3-minimal python3.8 python3.8-minimal
  readline-common shared-mime-info sound-theme-freedesktop systemd
  systemd-sysv systemd-timesyncd tzdata ubuntu-mono xkb-data
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
