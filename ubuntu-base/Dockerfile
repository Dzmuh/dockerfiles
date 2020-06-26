FROM ubuntu:20.04
LABEL maintainer "Ilya Fralkou <ilya-fralkou@outlook.com>"

# Simple Go-based setuid+setgid+setgroups+exec
# https://github.com/tianon/gosu
ARG VERSION_GOSU=1.12

# Необходимо избегать диалоговых окон выбора, которые, например, появляются при вызове `dpkg-reconfigure locales`.
# Это можно сделать выставляя глобальные параметры Debian.
ENV LANG=C.UTF-8 \
    KEY_SERVER="hkp://keyserver.ubuntu.com:80" \
    DEBCONF_NONINTERACTIVE_SEEN=true \
    DEBIAN_FRONTEND=noninteractive \
    # Избавляемся от предпреждения: "Warning: apt-key output should not be parsed (stdout is not a terminal)"
    APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=any-value

# Избавляемся от предпреждения: "debconf: delaying package configuration, since apt-utils is not installed" устанавливая apt-utils. 
RUN apt-get update --quiet --quiet \
 && apt-get install --quiet --quiet --no-install-recommends \
    apt-utils \
    language-pack-en-base \
    language-pack-ru-base

# Настройка локалей должна выполнятся после установки пакетов локализации, вроде language-pack-en-base,
# так как во время установки выполняется генерация и настройка локалей,
# без которых можно получить предупреждение: "/bin/bash: warning: setlocale: LC_ALL: cannot change locale "
ENV LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

RUN apt-get install --quiet --quiet --no-install-recommends \
    curl \
    dirmngr \
    gnupg-agent \
    software-properties-common \
    unzip \
    xz-utils

# Устанавливаем утилиту gosu для выполнения ею команд от имени пользователя в entrypoint.sh
WORKDIR /usr/bin
RUN curl \
    --fail \
    --location \
    --show-error \
    --remote-name \
    https://github.com/tianon/gosu/releases/download/${VERSION_GOSU}/gosu-amd64{,.asc} \
 && gpg --batch --keyserver "${KEY_SERVER}" --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
 && gpg --batch --verify gosu-amd64.asc gosu-amd64 \
 && rm --force gosu-amd64.asc \
 && mv gosu-amd64 gosu \
 && chown root gosu \
 && chmod +sx gosu

COPY context /