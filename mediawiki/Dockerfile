FROM ubuntu:20.04
LABEL maintainer "Ilya Fralkou <ilya-fralkou@outlook.com>" version="1.35-fpm-ubuntu"

# Необходимо избегать диалоговых окон выбора, которые, например, появляются при вызове `dpkg-reconfigure locales`.
# Это можно сделать выставляя глобальные параметры Debian.
ENV LANG=C.UTF-8 \
    KEY_SERVER="hkp://keyserver.ubuntu.com:80" \
    DEBCONF_NONINTERACTIVE_SEEN=true \
    DEBIAN_FRONTEND=noninteractive \
    # Избавляемся от предпреждения: "Warning: apt-key output should not be parsed (stdout is not a terminal)"
    APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=any-value

# System dependencies
RUN apt-get update; \
	apt-get install -y --no-install-recommends \
        composer \
        git \
		imagemagick \
        libgd3 \
		librsvg2-bin \
        # Added for PHP 7.4
        libonig-dev \
        mc \
        php-fpm \
		# Required for SyntaxHighlighting
		python3 \
        unzip \
	; \
    rm -rf /var/lib/apt/lists/*

# Install the PHP extensions we need
RUN apt-get update; \
	apt-get install -y --no-install-recommends \
		libicu-dev \
		php-apcu \
        php-gd \
		php-intl \
		php-mbstring \
		php-sqlite3 \
		php-mysql \
		php7.4-opcache \
        php-xml \
		; \
	rm -rf /var/lib/apt/lists/*
