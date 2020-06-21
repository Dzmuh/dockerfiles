# xclock

Build:

``` bash
docker build --pull --rm -f "./Dockerfile" -t dzmuh/xclock:latest "xclock" "$(pwd)"
```

Run:

``` bash
docker run -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --user="$(id --user):$(id --group)" dzmuh/xclock
```
