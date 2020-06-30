# QuiteRSS

## Требования

- Docker
- Операционная система Ubuntu

## Сборка

Build:

``` bash
docker build --pull --rm -f "./Dockerfile" -t local/quiterss:latest "$(pwd)"
```

Список пакетов которые будут установлены на базовый образ:

``` txt
TODO:
```

## Запуск

Тестовый запуск:

``` bash
docker run --rm -it --name quiterss \
    --hostname=$(hostname) \
    --device /dev/snd \
    -e DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v "/home/$(whoami)/.Xauthority:/home/user/.Xauthority" \
    -v /etc/localtime:/etc/localtime:ro \
    local/quiterss
```

### Запуск с сохранением всех настроек и файлов данных в стандартном расположении

Нужно создать стандартные расположения, чтобы их не создала служба Docker со всеми вытекающими последствиями в виде рутованых прав доступа.

``` bash
mkdir ~/.config/QuiteRss/
mkdir ~/.local/share/QuiteRss/
```

Запуск:

``` bash
docker run --rm -it --name quiterss \
    --hostname=$(hostname) \
    --device /dev/snd \
    -e DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v "/home/$(whoami)/.Xauthority:/home/user/.Xauthority" \
    -v "/home/$(whoami)/.config/QuiteRss:/home/user/.config/QuiteRss/" \
    -v "/home/$(whoami)/.local/share/QuiteRss/:/home/user/.local/share/QuiteRss/" \
    -v /etc/localtime:/etc/localtime:ro \
    local/quiterss
```

## Ссылки

Thanks!:

* [stevenk11/quiterss - Docker Hub](https://hub.docker.com/r/stevenk11/quiterss)
  * [sources](https://github.com/stevenk11/quiterss)