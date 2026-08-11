FROM ghcr.io/containerpak/gtk:main

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates curl git openjdk-21-jre && \
    mkdir -p /opt/gitnuro && \
    curl -fsSL https://github.com/JetpackDuba/Gitnuro/releases/download/v1.5.0/Gitnuro-linux-x86_64-1.5.0.jar \
      -o /opt/gitnuro/Gitnuro.jar && \
    echo '128063c3df0ee603b6c133b7e0a32215eb5eaf261aa590bcdcc51f22ac6d6e64  /opt/gitnuro/Gitnuro.jar' | sha256sum -c - && \
    curl -fsSL https://raw.githubusercontent.com/JetpackDuba/Gitnuro/9badc561bebf633ce29e85e6d92761820d45b265/icons/logo.svg \
      -o /usr/share/icons/hicolor/scalable/apps/com.jetpackduba.Gitnuro.svg && \
    echo '40625c5934897ac2290c0ace5a24b72a7d62ce7cde305cefa92f82b8d5e1ddab  /usr/share/icons/hicolor/scalable/apps/com.jetpackduba.Gitnuro.svg' | sha256sum -c - && \
    cpak-clean-junk

COPY gitnuro /usr/bin/gitnuro
COPY com.jetpackduba.Gitnuro.desktop /usr/share/applications/com.jetpackduba.Gitnuro.desktop
