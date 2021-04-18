# MediaWiki

## Build and push

Build:

``` bash
docker build --pull --rm -f "./Dockerfile" -t dzmuh/mediawiki:php-fpm "$(pwd)"
docker build --pull --rm -f "./Dockerfile" -t dzmuh/mediawiki:latest "$(pwd)"
```

To push a new tag to repository:

``` bash
docker push dzmuh/mediawiki:php-fpm
docker push dzmuh/mediawiki:latest
```

## Run

Запуск mediawik.

``` bash
docker run -p 8488:80 --name "wikitest" -e TZ='Europe/Minsk' -d dzmuh/mediawiki
```

## Links

* [Official MediaWiki Site](https://www.mediawiki.org/wiki/MediaWiki)
* [Official MediaWiki Docker Image](https://hub.docker.com/_/mediawiki)
  * [MediaWiki Docker Image on Github](https://github.com/wikimedia/mediawiki-docker)
* [Official PHP Docker Image](https://hub.docker.com/_/php)
  * [PHP Docker Image on Github](https://github.com/docker-library/php)
* [Official MariaDB Docker Image](https://hub.docker.com/_/mariadb)
  * [MariaDB Docker Image on Github](https://github.com/MariaDB/mariadb-docker)
* [Official Composer Docker Image](https://hub.docker.com/_/composer)
  * [Composer Docker Image on Github](https://github.com/composer/docker/)
