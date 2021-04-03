FROM mediawiki:1.35.1 as builder
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

# https://www.mediawiki.org/wiki/Special:MyLanguage/Extension:TemplateWizard
RUN git clone --depth 1 -b REL1_35 \
        https://github.com/wikimedia/mediawiki-extensions-TemplateWizard.git \
        /tmp/extensions/TemplateWizard

RUN git clone --depth 1 -b REL1_35 \
        https://github.com/wikimedia/mediawiki-extensions-NativeSvgHandler.git \
        /tmp/extensions/NativeSvgHandler

FROM mediawiki:1.35.1
LABEL maintainer "Ilya Fralkou <ilya-fralkou@outlook.com>" version="1.35.1-lts"

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

COPY --from=builder /tmp/extensions /var/www/html/extensions

RUN curl -Ls https://getcomposer.org/installer -o installer && \
        php installer --1 && \
        php composer.phar install --no-dev && \
        chmod a+x composer.phar && \
        mv composer.phar /usr/bin/composer && \
        rm installer
