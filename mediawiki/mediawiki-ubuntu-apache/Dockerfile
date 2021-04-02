FROM ubuntu:20.04
LABEL maintainer "Ilya Fralkou <ilya-fralkou@outlook.com>" version="1.35-apache-ubuntu"

# Apache Environment
ENV APACHE_CONFDIR /etc/apache2
ENV APACHE_ENVVARS $APACHE_CONFDIR/envvars
# Mediawiki Version
ENV MEDIAWIKI_MAJOR_VERSION 1.35
ENV MEDIAWIKI_VERSION 1.35.1
# Необходимо избегать диалоговых окон выбора, которые, например, появляются при вызове `dpkg-reconfigure locales`.
# Это можно сделать выставляя глобальные параметры Debian.
ENV LANG=C.UTF-8 \
    KEY_SERVER="hkp://keyserver.ubuntu.com:80" \
    DEBCONF_NONINTERACTIVE_SEEN=true \
    DEBIAN_FRONTEND=noninteractive \
    # Избавляемся от предпреждения: "Warning: apt-key output should not be parsed (stdout is not a terminal)"
    APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=any-value

# Install requered packages and php extensions
RUN set -x; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    apache2 \
    libapache2-mod-php7.4 \
    apt-utils \
    ca-certificates \
    composer \
    curl \
    git \
    ghostscript \
    imagemagick \
    libgd3 \
    libicu-dev \
    librsvg2-bin \
    # Added for PHP 7.4
    libonig-dev \
    mc \
    # PDF utils
    poppler-utils \
    # Install the PHP extensions we need
    php7.4 \
    php7.4-cli \
    php-apcu \
    php7.4-gd \
    php-intl \
    php7.4-mbstring \
    php7.4-sqlite3 \
    php7.4-mysql \
    php7.4-opcache \
    php7.4-xml \
    # Required for SyntaxHighlighting
    python3 \
    unzip \
    ; \
    rm -rf /var/lib/apt/lists/*

# SQLite Directory Setup
RUN set -eux; \
    mkdir -p /var/www/data; \
    chown -R www-data:www-data /var/www/data

# Apache + PHP requires preforking Apache for best results
RUN a2dismod mpm_event && a2enmod mpm_prefork

# Enable Short URLs
RUN set -eux; \
	a2enmod rewrite; \
	{ \
		echo "<Directory /var/www/html>"; \
		echo "  RewriteEngine On"; \
		echo "  RewriteCond %{REQUEST_FILENAME} !-f"; \
		echo "  RewriteCond %{REQUEST_FILENAME} !-d"; \
		echo "  RewriteRule ^ %{DOCUMENT_ROOT}/index.php [L]"; \
		echo "</Directory>"; \
	} > "$APACHE_CONFDIR/conf-available/short-url.conf"; \
	a2enconf short-url

# Enable AllowEncodedSlashes for VisualEditor
RUN sed -i "s/<\/VirtualHost>/\tAllowEncodedSlashes NoDecode\n<\/VirtualHost>/" "$APACHE_CONFDIR/sites-available/000-default.conf"

COPY apache2-foreground /usr/local/bin/
WORKDIR /var/www/html

# MediaWiki setup
RUN set -eux; \
	fetchDeps=" \
		gnupg \
		dirmngr \
	"; \
	apt-get update; \
	apt-get install -y --no-install-recommends $fetchDeps; \
	\
	curl -fSL "https://releases.wikimedia.org/mediawiki/${MEDIAWIKI_MAJOR_VERSION}/mediawiki-${MEDIAWIKI_VERSION}.tar.gz" -o mediawiki.tar.gz; \
	curl -fSL "https://releases.wikimedia.org/mediawiki/${MEDIAWIKI_MAJOR_VERSION}/mediawiki-${MEDIAWIKI_VERSION}.tar.gz.sig" -o mediawiki.tar.gz.sig; \
	export GNUPGHOME="$(mktemp -d)"; \
# gpg key from https://www.mediawiki.org/keys/keys.txt
	gpg --batch --keyserver ha.pool.sks-keyservers.net --recv-keys \
		D7D6767D135A514BEB86E9BA75682B08E8A3FEC4 \
		441276E9CCD15F44F6D97D18C119E1A64D70938E \
		F7F780D82EBFB8A56556E7EE82403E59F9F8CD79 \
		1D98867E82982C8FE0ABC25F9B69B3109D3BB7B0 \
	; \
	gpg --batch --verify mediawiki.tar.gz.sig mediawiki.tar.gz; \
	tar -x --strip-components=1 -f mediawiki.tar.gz; \
	gpgconf --kill all; \
	rm -r "$GNUPGHOME" mediawiki.tar.gz.sig mediawiki.tar.gz; \
	chown -R www-data:www-data extensions skins cache images; \
	\
	apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false $fetchDeps; \
	rm -rf /var/lib/apt/lists/*

EXPOSE 80
CMD ["apache2-foreground"]
