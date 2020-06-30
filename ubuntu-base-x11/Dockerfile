FROM dzmuh/ubuntu-base
LABEL maintainer "Ilya Fralkou <ilya-fralkou@outlook.com>"

# Вывод звука и видео требует членства в группах audio и video для загрузки драйверов и доступа к DRM
ENV ENTRYPOINT_GROUPS="audio,video"

RUN apt-get install --quiet --quiet --no-install-recommends \
    # Advanced Linux Sound Architecture
    alsa-base \
    dbus-x11 \
    # ---  Только основные драйвера  ---
    # Intel i8xx, i9xx display driver
    xserver-xorg-video-intel \
    # AMDGPU display driver
    xserver-xorg-video-amdgpu \
    # Nouveau display driver
    xserver-xorg-video-nouveau \
    # NVIDIA binary Xorg driver
    xserver-xorg-video-nvidia-440 \
    # Layout and rendering of internationalized text
    libpango1.0 \
    # PulseAudio backend for libcanberra
    libcanberra-pulse \
    libgtk-3-0 \
    mc \
    # desktop integration utilities from freedesktop.org
    xdg-utils \
    #  X.Org X server
    xorg