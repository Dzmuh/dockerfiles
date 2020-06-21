# xclock

Build:

``` bash
docker build --pull --rm -f "./Dockerfile" -t local/xclock:latest "$(pwd)"
```

Run:

``` bash
docker run --rm --name xclock \
    -e DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --user="$(id --user):$(id --group)" \
    local/xclock
```
