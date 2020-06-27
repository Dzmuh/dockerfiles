docker run --rm -it --name gimp \
    --hostname=$(hostname) \
    --device /dev/snd \
    -e DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v "/home/$(whoami)/.Xauthority:/home/user/.Xauthority" \
    -v /etc/localtime:/etc/localtime:ro \
    local/gimp