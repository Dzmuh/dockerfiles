# Chromium browser

Тут сложности: chromium snap. snap не хочет работать в контейнере.

## Build

``` bash
docker build --pull --rm -f "./Dockerfile" -t local/chromium:latest "$(pwd)"
```

Список пакетов которые будут установлены на базовый образ:

``` txt
apparmor ca-certificates chromium-browser chromium-codecs-ffmpeg-extra
  libapparmor1 libargon2-1 libcap2 libcbor0.6 libcryptsetup12
  libdevmapper1.02.1 libedit2 libfido2-1 libfuse2 libgssapi-krb5-2 libip4tc2
  libjson-c4 libk5crypto3 libkeyutils1 libkmod2 libkrb5-3 libkrb5support0
  liblzo2-2 libmpdec2 libpython3-stdlib libpython3.8-minimal
  libpython3.8-stdlib libreadline8 libsqlite3-0 libssl1.1 mime-support
  openssh-client openssl python3 python3-minimal python3.8 python3.8-minimal
  readline-common snapd squashfs-tools systemd systemd-timesyncd udev
```

## Запуск

Тестовый запуск:

``` bash
docker run --rm -it --name chromium-x11 \
    --hostname=$(hostname) \
    --device /dev/snd \
    -e DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v "/home/$(whoami)/.Xauthority:/home/user/.Xauthority" \
    -v /etc/localtime:/etc/localtime:ro \
    local/chromium
```

### Запуск с сохранением всех настроек и файлов данных в стандартном расположении

Нужно создать стандартные расположения, чтобы их не создала служба Docker со всеми вытекающими последствиями в виде рутованых прав доступа.

``` bash
mkdir ~/.mozilla/docker-chromium-x11/
```

Запуск:

``` bash
docker run --rm -it --name chromium-x11 \
    --hostname=$(hostname) \
    --device /dev/snd \
    -e DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v "/home/$(whoami)/.Xauthority:/home/user/.Xauthority" \
    -v "/home/$(whoami)/:/home/user/" \
    -v /etc/localtime:/etc/localtime:ro \
    local/chromium
```

## Links

Thanks!:
