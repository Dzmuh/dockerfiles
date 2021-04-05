# MediaWiki

## Build and push

Build:

``` bash
docker build --pull --rm -f "./Dockerfile" -t dzmuh/mediawiki:latest "$(pwd)"
```

To push a new tag to repository:

``` bash
docker push dzmuh/mediawiki:latest
```

## Run

### SQLite & MediaWiki

Install:

``` bash
docker run -d -p 80:80 \
--name mw \
-v $(pwd)/.data/sqlite:/var/www/data \
-v $(pwd)/.data/images:/var/www/html/images \
dzmuh/mediawiki:latest
```

Run:

``` bash
docker run -d -p 80:80 \
--name mw \
-v $(pwd)/.data/sqlite:/var/www/data \
-v $(pwd)/.data/images:/var/www/html/images \
-v $(pwd)/LocalSettings.SQLite.php:/var/www/html/LocalSettings.php \
dzmuh/mediawiki:latest
```

### MariaDB & MediaWiki

Install:

```bash
docker network create mediawiki \
; \
docker run -d -p 3306:3306 \
--net mediawiki \
--name mw-mariadb \
-e MYSQL_ROOT_PASSWORD=my-secret-pw \
-v $(pwd)/.data/mariadb:/var/lib/mysql \
mariadb:latest \
; \
docker run -d -p 80:80 \
--net mediawiki \
--name mw \
-v $(pwd)/.data/images:/var/www/html/images \
dzmuh/mediawiki:latest
```

Run:

``` bash
docker run -d -p 80:80 \
--name mw \
-v $(pwd)/.data/images:/var/www/html/images \
-v $(pwd)/LocalSettings.MariaDB.php:/var/www/html/LocalSettings.php \
dzmuh/mediawiki:latest
```

## Links

* [Official Site](https://www.mediawiki.org/wiki/MediaWiki)
* [Official MediaWiki Docker Image](https://hub.docker.com/_/mediawiki)
  * [MediaWiki Docker Image on Github](https://github.com/wikimedia/mediawiki-docker)
* [Official PHP Docker Image](https://hub.docker.com/_/php)
  * [PHP Docker Image on Github](https://github.com/docker-library/php)
* [Official MariaDB Docker Image](https://hub.docker.com/_/mariadb)
  * [MariaDB Docker Image on Github](https://github.com/MariaDB/mariadb-docker)
* [Official Composer Docker Image](https://hub.docker.com/_/composer)
  * [Composer Docker Image on Github](https://github.com/composer/docker/)
