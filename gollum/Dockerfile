FROM ruby
LABEL maintainer "Ilya Fralkou <ilya-fralkou@outlook.com>"

ARG TZ=Europe/Minsk
RUN ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && apt-get -y install libicu-dev cmake && rm -rf /var/lib/apt/lists/*
RUN gem install github-linguist
RUN gem install gollum
RUN gem install org-ruby  # optional
# Ставлю расширения для поддержки AsciiDoc, MediaWiki и Textile
RUN gem install asciidoctor && \
    gem install wikicloth && \
    gem install RedCloth
WORKDIR /wiki
ENTRYPOINT ["gollum", "--port", "8080"]
EXPOSE 8080