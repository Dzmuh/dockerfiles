FROM mediawiki:1.35.1 as builder

# Mediawiki Version
ENV MEDIAWIKI_BRANCH REL1_35

# Install requered packages
RUN set -x; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    git \
    ; \
    rm -rf /var/lib/apt/lists/* \
    ; \
    rm -rf /var/cache/apt/archives/* \s

RUN git clone --depth 1 --single-branch -b $MEDIAWIKI_BRANCH \
        https://github.com/wikimedia/mediawiki-extensions-NativeSvgHandler.git \
        /tmp/extensions/NativeSvgHandler \
        ; \
        rm -rf /tmp/extensions/NativeSvgHandler/.git

# https://www.mediawiki.org/wiki/Special:MyLanguage/Extension:TemplateWizard
RUN git clone --depth 1 --single-branch -b $MEDIAWIKI_BRANCH \
        https://github.com/wikimedia/mediawiki-extensions-TemplateWizard.git \
        /tmp/extensions/TemplateWizard \
        ; \
        rm -rf /tmp/extensions/TemplateWizard/.git

FROM mediawiki:1.35.1
LABEL maintainer "Ilya Fralkou <ilya-fralkou@outlook.com>" version="1.35.1-lts"

ENV MEDIAWIKI_BRANCH REL1_35 \
    APACHE_LOG_DIR=/var/log/apache2

# Install requered packages and php extensions
RUN set -x; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    # TODO: composer
    git \
    ghostscript \
    imagemagick \
    libgd3 \
    librsvg2-bin \
    mc \
    # PDF utils
    poppler-utils \
    # Required for SyntaxHighlighting
    python3 \
    unzip \
    ; \
    rm -rf /var/lib/apt/lists/* \
    ; \
    rm -rf /var/cache/apt/archives/* \s

# SQLite Directory Setup
RUN set -eux; \
    mkdir -p /var/www/data; \
    chown -R www-data:www-data /var/www/data

COPY --from=builder /tmp/extensions /var/www/html/extensions
COPY composer.local.json /var/www/html/composer.local.json

# https://www.mediawiki.org/wiki/Composer
RUN curl -Ls https://getcomposer.org/installer -o installer; \
        php installer --1; \
        php composer.phar install --no-dev; \
        chmod a+x composer.phar; \
        mv composer.phar /usr/bin/composer; \
        rm installer

VOLUME /var/www/data
VOLUME /var/www/html/images
