FROM mediawiki:1.38.4 as builder

# Mediawiki Version
ENV MEDIAWIKI_BRANCH REL1_38

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

# https://github.com/wikimedia/mediawiki-extensions-CharInsert
# https://www.mediawiki.org/wiki/Extension:CharInsert
RUN git clone --depth 1 --single-branch -b $MEDIAWIKI_BRANCH \
        https://github.com/wikimedia/mediawiki-extensions-CharInsert.git \
        /tmp/extensions/CharInsert \
        ; \
        rm -rf /tmp/extensions/CharInsert/.git

# https://github.com/wikimedia/mediawiki-extensions-Disambiguator
# https://www.mediawiki.org/wiki/Extension:Disambiguator
RUN git clone --depth 1 --single-branch -b $MEDIAWIKI_BRANCH \
        https://github.com/wikimedia/mediawiki-extensions-Disambiguator.git \
        /tmp/extensions/Disambiguator \
        ; \
        rm -rf /tmp/extensions/Disambiguator/.git

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

# https://www.mediawiki.org/wiki/Extension:TemplateStyles
RUN git clone --depth 1 --single-branch -b $MEDIAWIKI_BRANCH \
        https://github.com/wikimedia/mediawiki-extensions-TemplateStyles.git \
        /tmp/extensions/TemplateStyles \
        ; \
        rm -rf /tmp/extensions/TemplateStyles/.git

# https://www.mediawiki.org/wiki/Extension:YouTube
RUN git clone --depth 1 --single-branch -b $MEDIAWIKI_BRANCH \
        https://github.com/wikimedia/mediawiki-extensions-YouTube.git \
        /tmp/extensions/YouTube \
        ; \
        rm -rf /tmp/extensions/YouTube/.git

# https://www.mediawiki.org/wiki/Extension:Flex_Diagrams
# https://github.com/wikimedia/mediawiki-extensions-FlexDiagrams
RUN git clone --depth 1 --single-branch -b $MEDIAWIKI_BRANCH \
        https://github.com/wikimedia/mediawiki-extensions-FlexDiagrams.git \
        /tmp/extensions/FlexDiagrams \
        ; \
        rm -rf /tmp/extensions/FlexDiagrams/.git

FROM mediawiki:1.38.4
LABEL maintainer "Ilya Fralkou <ilya-fralkou@outlook.com>" version="1.38.4-lts"

ENV MEDIAWIKI_BRANCH REL1_38 \
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
