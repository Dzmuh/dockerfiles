FROM ubuntu:20.04
LABEL maintainer "Ilya Fralkou <ilya-fralkou@outlook.com>" version="1.35-fpm-ubuntu"

## Mediawiki Version
#ENV MEDIAWIKI_MAJOR_VERSION 1.35
#ENV MEDIAWIKI_VERSION 1.35.1
#
## Необходимо избегать диалоговых окон выбора, которые, например, появляются при вызове `dpkg-reconfigure locales`.
## Это можно сделать выставляя глобальные параметры Debian.
#ENV LANG=C.UTF-8 \
#    KEY_SERVER="hkp://keyserver.ubuntu.com:80" \
#    DEBCONF_NONINTERACTIVE_SEEN=true \
#    DEBIAN_FRONTEND=noninteractive \
#    # Избавляемся от предпреждения: "Warning: apt-key output should not be parsed (stdout is not a terminal)"
#    APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=any-value
#
## System dependencies
#RUN set -eux; \
#    \
#    apt-get update; \
#	apt-get install -y --no-install-recommends \
#        composer \
#        git \
#		imagemagick \
#        libgd3 \
#		librsvg2-bin \
#        # Added for PHP 7.4
#        libonig-dev \
#        mc \
#        php-fpm \
#		# Required for SyntaxHighlighting
#		python3 \
#        unzip \
#	; \
#    rm -rf /var/lib/apt/lists/*
#
## Install the PHP extensions we need
#RUN apt-get update; \
#	apt-get install -y --no-install-recommends \
#		libicu-dev \
#		php-apcu \
#        php-gd \
#		php-intl \
#		php-mbstring \
#		php-sqlite3 \
#		php-mysql \
#		php7.4-opcache \
#        php-xml \
#		; \
#	rm -rf /var/lib/apt/lists/*
#
## SQLite Directory Setup
#RUN set -eux; \
#	mkdir -p /var/www/data; \
#	chown -R www-data:www-data /var/www/data
#
## MediaWiki setup
#RUN fetchDeps=" \
#		gnupg \
#		dirmngr \
#	"; \
#	apt-get update; \
#	apt-get install -y --no-install-recommends $fetchDeps; \
#	\
#	curl -fSL "https://releases.wikimedia.org/mediawiki/${MEDIAWIKI_MAJOR_VERSION}/mediawiki-${MEDIAWIKI_VERSION}.tar.gz" -o mediawiki.tar.gz; \
#	curl -fSL "https://releases.wikimedia.org/mediawiki/${MEDIAWIKI_MAJOR_VERSION}/mediawiki-${MEDIAWIKI_VERSION}.tar.gz.sig" -o mediawiki.tar.gz.sig; \
#	export GNUPGHOME="$(mktemp -d)"; \
#    # gpg key from https://www.mediawiki.org/keys/keys.txt
#	gpg --batch --keyserver ha.pool.sks-keyservers.net --recv-keys \
#		D7D6767D135A514BEB86E9BA75682B08E8A3FEC4 \
#		441276E9CCD15F44F6D97D18C119E1A64D70938E \
#		F7F780D82EBFB8A56556E7EE82403E59F9F8CD79 \
#		1D98867E82982C8FE0ABC25F9B69B3109D3BB7B0 \
#	; \
#	gpg --batch --verify mediawiki.tar.gz.sig mediawiki.tar.gz; \
#	tar -x --strip-components=1 -f mediawiki.tar.gz; \
#	gpgconf --kill all; \
#	rm -r "$GNUPGHOME" mediawiki.tar.gz.sig mediawiki.tar.gz; \
#	chown -R www-data:www-data extensions skins cache images; \
#	\
#	apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false $fetchDeps; \
#	rm -rf /var/lib/apt/lists/*
#
#CMD ["php-fpm"]
