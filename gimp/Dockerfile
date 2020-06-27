FROM ubuntu:20.04
LABEL maintainer "Ilya Fralkou <dzmuh@dzmuh.com>"

# TODO Любопытно настроить сборку так, что бы не задавать DEBIAN_FRONTEND=noninteractive
ARG TZ=Europe/Minsk
RUN ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime
# Если не объявлять эту переменную, то во время установки некоторых пакетов понадобится их интерактивная настройка.
# Эта переменная позволяет её установить.
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    gimp gimp-data-extras gimp-dcraw gimp-dds gimp-gmic gimp-gap gimp-help-en gimp-help-ru \
    gimp-plugin-registry gimp-texturize && \
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

# Autorun Gimp
CMD ["gimp"]