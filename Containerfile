FROM ubuntu:26.04 AS source

ADD --checksum=sha256:128063c3df0ee603b6c133b7e0a32215eb5eaf261aa590bcdcc51f22ac6d6e64 https://github.com/JetpackDuba/Gitnuro/releases/download/v1.5.0/Gitnuro-linux-x86_64-1.5.0.jar /tmp/Gitnuro.jar
ADD --checksum=sha256:40625c5934897ac2290c0ace5a24b72a7d62ce7cde305cefa92f82b8d5e1ddab https://raw.githubusercontent.com/JetpackDuba/Gitnuro/9badc561bebf633ce29e85e6d92761820d45b265/icons/logo.svg /tmp/com.jetpackduba.Gitnuro.svg

FROM ghcr.io/containerpak/gtk3:main

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends git openjdk-21-jre && \
    cpak-clean-junk

COPY --from=source /tmp/Gitnuro.jar /opt/gitnuro/Gitnuro.jar
COPY --from=source /tmp/com.jetpackduba.Gitnuro.svg /usr/share/icons/hicolor/scalable/apps/com.jetpackduba.Gitnuro.svg
COPY gitnuro /usr/bin/gitnuro
COPY com.jetpackduba.Gitnuro.desktop /usr/share/applications/com.jetpackduba.Gitnuro.desktop
