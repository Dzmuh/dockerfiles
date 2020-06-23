#!/usr/bin/env bash
docker run --rm -it --name firefox-x11 \
    --hostname=$(hostname) \
    --device /dev/snd \
    -e DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v "/home/$(whoami)/.Xauthority:/home/user/.Xauthority" \
    -v "/home/$(whoami)/.mozilla/docker-firefox-x11:/home/user/.mozilla/firefox/" \
    -v /etc/localtime:/etc/localtime:ro \
    local/firefox