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

## Links

* [Official Site](https://www.mediawiki.org/wiki/MediaWiki)
* [Official MediaWiki Docker Image](https://hub.docker.com/_/mediawiki)
  * [MediaWiki Docker Image on Github](https://github.com/wikimedia/mediawiki-docker)
* [Official PHP Docker Image](https://hub.docker.com/_/php)
  * [PHP Docker Image on Github](https://github.com/docker-library/php)
