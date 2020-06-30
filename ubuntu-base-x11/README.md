# ubuntu-base-x11

## Сборка

Build:

``` bash
docker build --pull --rm -f "./Dockerfile" -t dzmuh/ubuntu-base-x11:latest "$(pwd)"
```

To push a new tag to repository:

``` bash
docker push dzmuh/ubuntu-base-x11:latest
```

## Ссылки

* [dzmuh/ubuntu-base-x11 - Docker Hub](https://hub.docker.com/repository/docker/dzmuh/ubuntu-base-x11)