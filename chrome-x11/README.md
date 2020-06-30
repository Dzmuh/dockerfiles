# Google Chrome browser in Docker

## Требования

- Docker
- Операционная система Ubuntu

## Сборка

``` bash
docker build --pull --rm -f "./Dockerfile" -t dzmuh/chrome-x11:latest "$(pwd)"
```

To push a new tag to repository:

``` bash
docker push dzmuh/chrome-x11:latest
```
