# Confluence Server

Docker image with Atlassian Confluence & graphviz

Build:

``` bash
docker build --pull --rm -f "./Dockerfile" -t dzmuh/confluence:latest "$(pwd)"
```

## Запуск

Запуск confluence

``` bash
docker run -p 8090:8090 --name "confluence-srv" -e TZ='Europe/Minsk' dzmuh/confluence
```

## Ссылки

* [dzmuh/confluence - Docker Hub](https://hub.docker.com/r/dzmuh/confluence)
* [atlassian/confluence-server - Docker Hub](https://hub.docker.com/r/atlassian/confluence-server)

Спасибки за идею:

* [ mimacom / docker-confluence ](https://github.com/mimacom/docker-confluence)
