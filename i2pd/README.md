# i2pd

 docker-compose up -d
 sudo chown -R dhcpcd:65533 ./.data

 C:\Users\user\AppData\Local\Chromium\Application\chrome.exe --proxy-server="http://127.0.0.1:4444"

Docker-файл сделан на базе [Dockerfile](https://github.com/PurpleI2P/i2pd/blob/openssl/contrib/docker/Dockerfile) из [официального репозитория](https://github.com/PurpleI2P/i2pd).

## Build and push

Build:

``` bash
docker build --pull --rm -f "./Dockerfile" -t dzmuh/i2pd:latest "$(pwd)"
```

To push a new tag to repository:

``` bash
docker push dzmuh/i2pd:latest
```

## Run

Запуск i2pd.

``` bash
docker run -p 7070:7070 --name "i2pdtest" -e TZ='Europe/Minsk' -d dzmuh/i2pd
```

## Ссылки

* [Official site](https://i2pd.website/)
* [i2pd - Github](https://github.com/PurpleI2P/i2pd)
* [Официальный образ на Docker Hub](https://hub.docker.com/r/purplei2p/i2pd)

; Сборка

* <https://hub.docker.com/r/meeh/i2pd>
* <https://hub.docker.com/r/meeh/i2p.i2p>
* <https://hub.docker.com/r/ksey/i2pd>
* <https://hub.docker.com/r/geti2p/i2p>
* <https://hub.docker.com/r/divax/i2p>
