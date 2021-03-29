FROM mediawiki:1.35.1
LABEL maintainer "Ilya Fralkou <ilya-fralkou@outlook.com>" version="1.35.1-lts"

# Install missung stuff and php extensions
RUN apt-get update; \
    apt-get install -y --no-install-recommends \
    ghostscript \
    imagemagick \
    librsvg2-bin \
    mc \
    # PDF utils
    poppler-utils \
    # Required for SyntaxHighlighting
    python3 \
    unzip
