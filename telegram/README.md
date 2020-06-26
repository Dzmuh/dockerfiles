# Telegram in Docker

Идеи позаимствованы у [xorilog/docker-telegram](https://github.com/xorilog/docker-telegram).

Build:

``` bash
docker build --pull --rm -f "./Dockerfile" -t dzmuh/telegram:latest "$(pwd)"
```

## Запуск

Внимание!
Создайте папку `~/.TelegramDesktop`.
Папка `~/.TelegramDesktop` должна быть создана перед запуском контейнера пользователем, иначе эту папку создаст служба стартующая образ и её хозяином будет пользователь `root` и так как образ в дальнейшем работает в контексте обычного пользователя, то Telegram не сможет делать в неё запись и приложение будет не работоспособным.

``` bash
docker run --rm -it --name telegram \
    --hostname=$(hostname) \
    --device /dev/snd \
    -e DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v "/home/$(whoami)/.Xauthority:/home/user/.Xauthority" \
    -v "/home/$(whoami)/.TelegramDesktop:/home/user/.local/share/TelegramDesktop/" \
    -v /etc/localtime:/etc/localtime:ro \
    dzmuh/telegram
```

Можно прокинуть папку загрузок:

``` bash
docker run --rm -it --name telegram \
    --hostname=$(hostname) \
    --device /dev/snd \
    -e DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v "/home/$(whoami)/.Xauthority:/home/user/.Xauthority" \
    -v "/home/$(whoami)/.TelegramDesktop:/home/user/.local/share/TelegramDesktop/" \
    -v "/home/$(whoami)/Downloads:/home/user/Downloads/" \
    -v /etc/localtime:/etc/localtime:ro \
    dzmuh/telegram
```

## Links

Thanks!:

* [xorilog/telegram - Docker Hub](https://hub.docker.com/r/xorilog/telegram)
  * [sources](https://github.com/xorilog/docker-telegram)